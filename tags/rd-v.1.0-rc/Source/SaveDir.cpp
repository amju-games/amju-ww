#include <Directory.h>
#include "SaveDir.h"

namespace Amju
{
static const char* APPNAME = "amju-ww";

std::string GetSaveDir()
{
  return GetSaveDir(APPNAME);
}
}

