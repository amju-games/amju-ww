#include <iostream>
#include <string>
#include <AmjuTime.h>
#include <ConfigFile.h>
#include <iOSUtils.h>
#include <UrlUtils.h>
#include "Depth.h"
#include "GameConsts.h"
#include "HiScoreDb.h"
#include "LevelManager.h"
#include "NetSend.h"
#include "Nicknames.h"
#include "Score.h"
#include "SerialReqManager.h"
#include "Version.h"

// Consts so never more than one copy of a string
#define URL_ROOT std::string("http://www.amju.com/cgi-bin/rd/")

namespace Amju
{
std::string DeviceManufacturer()
{
#if defined(AMJU_IOS) || defined(MACOSX)
  return "Apple";
#elif defined(WIN32)
  return "Windows";
#elif defined(GEKKO)
  return "Nintendo";
#else
  return "Unknown";
#endif
}
  
class NetSendDeviceInfoReq : public OnlineReq
{
public:
  NetSendDeviceInfoReq(
    const std::string& url,
    HttpClient::HttpMethod method,
    const std::string& name,
    const std::string& deviceId_,
    const std::string& deviceUserName_,
    const std::string& deviceModel_,
    const std::string& deviceOsVersion_) :
    OnlineReq(url, method, name),
    m_deviceId(deviceId_),
    m_deviceUserName(deviceUserName_),
    m_deviceModel(deviceModel_),
    m_deviceOsVersion(deviceOsVersion_) {}
  
  virtual void HandleResult()
  {
    HttpResult res = GetResult();
    if (res.GetSuccess())
    {
      // We can save device info to config file, which means we won't send again
      //  (unless we need to update, e.g. OS version changes)
      //#ifdef LOG_SUCCESSFUL_REQ
      std::cout << "Request '" << GetName() << "' success!\n";
      //#endif
      
      // Now we have successfully logged this on the server, it's OK to cache it locally so we don't send it
      //  again. If this request fails, we won't cache the info and will attempt to resend next time.
      GameConfigFile* gcf = TheGameConfigFile::Instance();
      gcf->Set(DEVICE_ID, m_deviceId);
      gcf->Set(DEVICE_OS_VERSION, m_deviceOsVersion);
      gcf->Set(DEVICE_USER_NAME, m_deviceUserName);
      gcf->Set(CLIENT_VERSION, GetVersionStr());
      gcf->Save();
    }
    else
    {
      std::cout << "Request '" << GetName() << "' FAILED!\n";
    }
  }

private:
  std::string m_deviceId;
  std::string m_deviceUserName;
  std::string m_deviceModel;
  std::string m_deviceOsVersion;
};
  
class NetSendReq : public OnlineReq
{
public:
#ifdef WIN32
    // Can't inherit ctor in MSVC 2013 ?
  NetSendReq(
    const std::string& url,
    HttpClient::HttpMethod method,
    const std::string& name) : OnlineReq(url, method, name) {}
#else
  using OnlineReq::OnlineReq;
#endif

  virtual void HandleResult()
  {
    HttpResult res = GetResult();
    if (res.GetSuccess())
    {
//#ifdef LOG_SUCCESSFUL_REQ
      std::cout << "Request '" << GetName() << "' success!\n";
//#endif
    }
    else
    {
      std::cout << "Request '" << GetName() << "' FAILED!\n";
    }
  }
};
  
class NetSendHiScoresReq : public OnlineReq
{
public:
#ifdef WIN32
  // Can't inherit ctor in MSVC 2013 ?
  NetSendHiScoresReq(
    const std::string& url,
    HttpClient::HttpMethod method,
    const std::string& name) : OnlineReq(url, method, name) {}
#else
  using OnlineReq::OnlineReq;
#endif
    
  virtual void HandleResult()
  {
    HttpResult res = GetResult();
    if (res.GetSuccess())
    {
      std::cout << "Request '" << GetName() << "' success!\n";
      // Parse response, set hi scores in global hi score table.
      TheGlobalHiScoreDb::Instance()->HandleResponseFromServer(res.GetString());
    }
    else
    {
      std::cout << "Request '" << GetName() << "' FAILED!\n";
    }
  }
};
  
class NetSendLocalHiScoreReq : public OnlineReq
{
public:
  NetSendLocalHiScoreReq(
    const std::string& url,
    HttpClient::HttpMethod method,
    const std::string& name,
    const Hi& hi) : OnlineReq(url, method, name), m_hi(hi) {}
  
  virtual void HandleResult()
  {
    HttpResult res = GetResult();
    if (res.GetSuccess())
    {
      std::cout << "Request '" << GetName() << "' success!\n";
      
      // Remove from local cache
      auto hidb = TheGlobalHiScoreDb::Instance();
      hidb->EraseLocal(m_hi);
      
      // Send another if we have local scores batched up
      hidb->SendLocal();
      
      // Parse response, set hi scores in global hi score table.
      hidb->HandleResponseFromServer(res.GetString());
    }
    else
    {
      std::cout << "Request '" << GetName() << "' FAILED!\n";
    }
  }
  
private:
  Hi m_hi; // the hi score we sent
};

static bool NetSendDeviceInfo(
  const std::string& deviceId,
  const std::string& deviceUserName,
  const std::string& deviceModel,
  const std::string& deviceOsVersion)
{
  std::string url = URL_ROOT +
    "rd_log_device.pl?"
    "device_id='" + EncodeStr(deviceId) + "'&"
    "device_user_name='" + EncodeStr(deviceUserName) + "'&"
    "device_model='" + EncodeStr(deviceModel) + "'&"
    "device_os_version='" + EncodeStr(deviceOsVersion) + "'&"
    "device_client_version='" + EncodeStr(GetVersionStr()) + "'&"
    "device_manufacturer='" + EncodeStr(DeviceManufacturer()) + "'";

std::cout << "Sending device info: " << url << "\n";
  
  auto req = new NetSendDeviceInfoReq(url, HttpClient::GET, "send device info",
    deviceId, deviceUserName, deviceModel, deviceOsVersion);
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;
}
  
bool NetSendDeviceInfoFirstRunEver()
{
  // First run: send network message to server identifying this device
  std::string deviceId;
  std::string deviceUserName;
  std::string deviceModel;
  std::string deviceOsVersion;
  
#ifdef AMJU_IOS
  int devId;
  GetDeviceInfo(&devId, &deviceUserName, &deviceModel, &deviceOsVersion);
  deviceId = ToString(devId);
#endif // AMJU_IOS
  
#ifdef _DEBUG
  std::cout << "Sending device info: " <<
  deviceId << ", " <<
  deviceUserName << ", " <<
  deviceModel << ", " <<
  deviceOsVersion << "\n";
#endif // _DEBUG
  
  NetSendDeviceInfo(deviceId, deviceUserName, deviceModel, deviceOsVersion);
  
  return true;
}

bool NetSendUpdateDeviceInfo()
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  
  // Check if anything has changed which we should update on the server.
  std::string deviceUserName;
  std::string deviceModel;
  std::string deviceOsVersion;

  int devId = 0;

#ifdef AMJU_IOS
  // Device ID and model should never change, but we get them anyway as that's
  //  what this function gives us. But we SEND the device ID we got when we first
  //  ran the program and saved in the config file. This is just in case the
  //  device ID is not constant over time.
  GetDeviceInfo(&devId, &deviceUserName, &deviceModel, &deviceOsVersion);
#endif // AMJU_IOS

  // Handle empty device ID, which you get upgrading from v.1.0
  std::string deviceId = gcf->GetValue(DEVICE_ID);
  if (deviceId.empty())
  {
    deviceId = ToString(devId);
    gcf->Set(DEVICE_ID, deviceId);
  }
  
  std::string prevDeviceOsVersion = gcf->GetValue(DEVICE_OS_VERSION);
  std::string prevDeviceUserName = gcf->GetValue(DEVICE_USER_NAME);
  std::string prevVersion = gcf->GetValue(CLIENT_VERSION);
  
  if (GetVersionStr() != prevVersion ||
      deviceOsVersion != prevDeviceOsVersion ||
      deviceUserName != prevDeviceUserName)
  {
    // Something has changed, so send update as for a new install.
    NetSendDeviceInfo(deviceId, deviceUserName, deviceModel, deviceOsVersion);
  }
  else
  {
std::cout << "NetSend: Nothing has changed, so not resending device info.\n";
  }

  return true;
}
  
static std::string s_sessionStart;
  
void NetSendMarkSessionStart()
{
  s_sessionStart = ToString(Time::Now().ToSeconds());
}
  
bool NetSendPlaySession(int flags)
{
  if (s_sessionStart.empty())
  {
    // Already sent session
    return false;
  }
  
  GameConfigFile* gcf = TheGameConfigFile::Instance();

  std::string now = ToString(Time::Now().ToSeconds());
  std::string level = ToString(TheLevelManager::Instance()->GetLevelId());
  // Assuming 1-player game for now, not multiplayer (Wii) - - TODO
  std::string depth = ToString(static_cast<int>(GetCurrentDepth()));
  auto scores = TheScores::Instance();
  std::string score = ToString(scores->GetScore(AMJU_P1));
  std::string lives = ToString(scores->GetLives(AMJU_P1));
  std::string flagStr = ToString(flags);
  
  std::string url = URL_ROOT +
    "rd_log_play_session.pl?"
    "device_id='" + EncodeStr(gcf->GetValue(DEVICE_ID)) + "'&"
    "session_start='" + EncodeStr(s_sessionStart) + "'&"
    "session_end='" + EncodeStr(now) + "'&"
    "session_level='" + EncodeStr(level) + "'&"
    "session_depth='" + EncodeStr(depth) + "'&"
    "session_score='" + EncodeStr(score) + "'&"
    "session_flags='" + EncodeStr(flagStr) + "'&"
    "session_lives='" + EncodeStr(lives) + "'";
  
  s_sessionStart.clear();

std::cout << "Sending play session info: " << url << "\n";
  
  auto req = new NetSendReq(url, HttpClient::GET, "send play session");
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;
}
  
// Is this info going to be useful??
bool NetSendButtonEvent(const std::string buttonName)
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  
  std::string now = ToString(Time::Now().ToSeconds());
 
  std::string url = URL_ROOT +
    "rd_log_button.pl?"
    "device_id='" + EncodeStr(gcf->GetValue(DEVICE_ID)) + "'&"
    "button_name='" + EncodeStr(buttonName) + "'&"
    "button_time='" + EncodeStr(now) + "'";

  auto req = new NetSendReq(url, HttpClient::GET, "send button event");
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;
}
  
bool NetSendRequestHiScores()
{
  // TODO Or even just a static page??
  std::string url = URL_ROOT + "rd_req_hi_scores.pl";
  auto req = new NetSendHiScoresReq(url, HttpClient::GET, "request hi scores");
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;
}
  
static std::string MakeHiScoreUrl(const std::string& nickname, int score, int level, int depth, const Vec3f& pos)
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  
  std::string url = URL_ROOT +
    "rd_log_hi_score.pl?"
    "device_id='" + EncodeStr(gcf->GetValue(DEVICE_ID)) + "'&"
    "score='" + EncodeStr(ToString(score)) + "'&"
    "level='" + EncodeStr(ToString(level)) + "'&"
    "depth='" + EncodeStr(ToString(depth)) + "'&"
    "x='" + EncodeStr(ToString(static_cast<int>(pos.x))) + "'&"
    "y='" + EncodeStr(ToString(static_cast<int>(pos.y))) + "'&"
    "z='" + EncodeStr(ToString(static_cast<int>(pos.z))) + "'&"
    "nick='" + EncodeStr(nickname) + "'";
  
  return url;
}
  
bool NetSendLocalHiScore(const std::string& nickname, int score, int level, int depth, const Vec3f& pos)
{
  std::string url = MakeHiScoreUrl(nickname, score, level, depth, pos);
  
  Hi hi(score, level, depth, nickname, pos);
  
  // Use NetSendHiScoresReq, i.e. response to adding a hi score is to get the new table in response.
  // Then we can update our local outstanding hi scores.
  auto req = new NetSendLocalHiScoreReq(url, HttpClient::GET, "log local hi score", hi);
  
  // Allow 2 of this kind of req: the one we are processing, and a new request to upload one
  //  more locally stored hi score.
  bool b = TheSerialReqManager::Instance()->AddReq(req, 2);
  return b;
}
}


