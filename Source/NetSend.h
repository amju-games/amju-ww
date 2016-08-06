#pragma once

namespace Amju
{
// NetSend* functions: send info to the server (and mostly don't need to care
//  about a response, which keeps things nice and simple).
  
// Call when there is no config file, so this is a fresh install.
// Sends device info to server with a unique device ID.
bool NetSendDeviceInfoFirstRunEver();
  
// Call when we start up, and there is a config file, so not the first run.
// But something could have changed which we should update on the server.
// E.g. client (i.e. this exe) version, OS version, etc.
bool NetSendUpdateDeviceInfo();

}

