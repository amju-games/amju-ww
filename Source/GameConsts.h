#pragma once

namespace Amju
{
// Options
extern const char* MUSIC_KEY;
extern const char* SOUND_KEY;

// TODO Get from config file!
extern const float DEATH_HEIGHT;

extern const char* CONTINUE_LEVEL_KEY;

extern const char* X_SENSITIVITY_KEY;
extern const char* Y_SENSITIVITY_KEY;

const int MUSIC_INITIAL_VAL = 1;
const int SOUND_INITIAL_VAL = 1;
  
#define DEVICE_ID "device_id"
#define DEVICE_OS_VERSION "device_os_version"
#define DEVICE_USER_NAME "device_user_name"
#define CLIENT_VERSION "client_version"
#define SESSION_ID "session_id"

#define SHARE_MAX_BUF_LEN 500
  
#define SCREENSHOT_W 300
#define SCREENSHOT_H 300
}

