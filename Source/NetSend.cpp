#include <iostream>
#include <string>
#include <AmjuTime.h>
#include <ConfigFile.h>
#include <iOSUtils.h>
#include <UrlUtils.h>
#include "Depth.h"
#include "HiScoreDb.h"
#include "LevelManager.h"
#include "NetSend.h"
#include "Nicknames.h"
#include "Score.h"
#include "SerialReqManager.h"
#include "Version.h"

// Consts so never more than one copy of a string
#define URL_ROOT std::string("http://www.amju.com/cgi-bin/rd/")
#define DEVICE_ID "device_id"
#define DEVICE_OS_VERSION "device_os_version"
#define DEVICE_USER_NAME "device_user_name"
#define CLIENT_VERSION "client_version"
#define SESSION_ID "session_id"

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
      std::cout << "Request '" << GetName() << "' success!\n";
      // Parse response, set hi scores in global hi score table.
      // Clear old hi scores, don't try to update.
      TheGlobalHiScoreDb::Instance()->HandleResponseFromServer(res.GetString());
    }
    else
    {
      std::cout << "Request '" << GetName() << "' FAILED!\n";
    }
  }
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
  
  auto req = new NetSendReq(url, HttpClient::GET, "send device info");
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
  
  // Store device ID for all subsequent runs
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->Set(DEVICE_ID, deviceId);
  gcf->Set(DEVICE_OS_VERSION, deviceOsVersion);
  gcf->Set(DEVICE_USER_NAME, deviceUserName);
  gcf->Set(CLIENT_VERSION, GetVersionStr());
  gcf->Save();
  
  return true;
}

bool NetSendUpdateDeviceInfo()
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  
  // Check if anything has changed which we should update on the server.
  std::string deviceUserName;
  std::string deviceModel;
  std::string deviceOsVersion;

#ifdef AMJU_IOS
  // Device ID and model should never change, but we get them anyway as that's
  //  what this function gives us. But we SEND the device ID we got when we first
  //  ran the program and saved in the config file. This is just in case the
  //  device ID is not constant over time.
  int devId;
  GetDeviceInfo(&devId, &deviceUserName, &deviceModel, &deviceOsVersion);
#endif // AMJU_IOS

  std::string deviceId = gcf->GetValue(DEVICE_ID);
  std::string prevDeviceOsVersion = gcf->GetValue(DEVICE_OS_VERSION);
  std::string prevDeviceUserName = gcf->GetValue(DEVICE_USER_NAME);
  std::string prevVersion = gcf->GetValue(CLIENT_VERSION);
  
  if (GetVersionStr() != prevVersion ||
      deviceOsVersion != prevDeviceOsVersion ||
      deviceUserName != prevDeviceUserName)
  {
    // Something has changed, so send update as for a new install.
    NetSendDeviceInfo(deviceId, deviceUserName, deviceModel, deviceOsVersion);

    // Update config file so next run we don't update the server again unnecessarily.
    gcf->Set(DEVICE_OS_VERSION, deviceOsVersion);
    gcf->Set(DEVICE_USER_NAME, deviceUserName);
    gcf->Set(CLIENT_VERSION, GetVersionStr());
    gcf->Save();
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
    "session_start='" + s_sessionStart + "'&"
    "session_end='" + now + "'&"
    "session_level='" + level + "'&"
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
    "button_time='" + now + "'";

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
  
bool NetSendHiScore(const std::string& nickname, int score, int level, int depth, const Vec3f& pos)
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

  auto req = new NetSendReq(url, HttpClient::GET, "log hi score");
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;

  return true;
}
}


