#include <iostream>
#include <string>
#include <AmjuTime.h>
#include <ConfigFile.h>
#include <iOSUtils.h>
#include <UrlUtils.h>
#include "Depth.h"
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
  
static bool NetSendDeviceInfo(
  const std::string& deviceId,
  const std::string& deviceUserName,
  const std::string& deviceModel,
  const std::string& deviceOsVersion)
{
  std::string url = URL_ROOT +
    "rd_log_device.pl?"
    "device_id='" + deviceId + "'&"
    "device_user_name='" + ToUrlFormat(deviceUserName) + "'&"
    "device_model='" + deviceModel + "'&"
    "device_os_version='" + deviceOsVersion + "'&"
    "device_client_version='" + GetVersionStr() + "'&"
    "device_manufacturer='" +
#if defined(AMJU_IOS) || defined(MACOSX)
  "Apple"
#elif defined(WIN32)
  "Windows"
#elif defined(GEKKO)
  "Wii"
#else
  "Unknown"
#endif
    + "'";
  
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
  GetDeviceInfo(&deviceId, &deviceUserName, &deviceModel, &deviceOsVersion);
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
  std::string deviceId;
  std::string deviceUserName;
  std::string deviceModel;
  std::string deviceOsVersion;

#ifdef AMJU_IOS
  // Device ID and model should never change, but we get them anyway as that's
  //  what this function gives us.
  GetDeviceInfo(&deviceId, &deviceUserName, &deviceModel, &deviceOsVersion);
#endif // AMJU_IOS

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

  // Update config file so next run we don't update the server again unnecessarily.
  gcf->Set(DEVICE_OS_VERSION, deviceOsVersion);
  gcf->Set(DEVICE_USER_NAME, deviceUserName);
  gcf->Set(CLIENT_VERSION, GetVersionStr());
  gcf->Save();

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

  int session = Time::Now().ToSeconds(); // so if we delete and re-install app, we don't restart IDs at zero
  if (gcf->Exists(SESSION_ID))
  {
    session = gcf->GetInt(SESSION_ID);
  }
  gcf->SetInt(SESSION_ID, session + 1);
  
  std::string now = ToString(Time::Now().ToSeconds());
  std::string level = ToString(TheLevelManager::Instance()->GetLevelId());
  // Assuming 1-player game for now, not multiplayer (Wii) - - TODO
  std::string depth = ToString(static_cast<int>(GetCurrentDepth()));
  std::string score = ToString(TheScores::Instance()->GetScore(AMJU_P1));
  std::string flagStr = ToString(flags);
  std::string nick = GetNick(AMJU_P1);
  
  std::string url = URL_ROOT +
  "rd_log_play_session.pl?"
  "device_id='" + gcf->GetValue(DEVICE_ID) + "'&"
  "session_id=" + ToString(session) + "&"
  "session_start='" + s_sessionStart + "'&"
  "session_end='" + now + "'&"
  "session_level='" + level + "'&"
  "session_depth='" + depth + "'&"
  "session_score='" + score + "'&"
  "session_flags='" + flagStr + "'&"
  "session_user_nick='" + nick + "'";
  
  s_sessionStart.clear();
  
  auto req = new NetSendReq(url, HttpClient::GET, "send play session");
  bool b = TheSerialReqManager::Instance()->AddReq(req);
  return b;
}
}


