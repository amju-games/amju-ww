#include <iostream>
#include <string>
#include <ConfigFile.h>
#include <iOSUtils.h>
#include <UrlUtils.h>
#include "NetSend.h"
#include "SerialReqManager.h"
#include "Version.h"

// Consts so never more than one copy of a string
#define DEVICE_ID "device_id"
#define DEVICE_OS_VERSION "device_os_version"
#define DEVICE_USER_NAME "device_user_name"
#define CLIENT_VERSION "client_version"

namespace Amju
{
class NetSendReq : public OnlineReq
{
public:
  using OnlineReq::OnlineReq;
  
  virtual void HandleResult()
  {
    HttpResult res = GetResult();
    if (res.GetSuccess())
    {
      std::cout << "Request '" << GetName() << "' success!\n";
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
  std::string url = "www.amju.com/cgi-bin/rd_log_device.pl?"
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

  return true;
}
}


