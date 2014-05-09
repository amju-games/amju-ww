#include <Directory.h>
#include "SaveDir.h"

namespace Amju
{
static const char* APPNAME = "amju-ww";

std::string GetSaveDir()
{
#ifdef ANDROID_NDK
// TODO TEMP TEST HACK 
// Quick test
  return "/data/data/com.amju.rainbowdrop/files/";
#endif

  return GetSaveDir(APPNAME);
}
}

