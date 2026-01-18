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
  
#define SCREENSHOT_W 600
#define SCREENSHOT_H 600
  
// Score must be within the top N to be considered a hi score.
const int HI_SCORE_TOP_N = 100;
  
// DB field is 40 varchar(40), and comprised of pairs of characters, where each pair is the
//  hex value for one char.
const int MAX_HI_SCORE_NAME_BYTE_LEN = 20;
}

