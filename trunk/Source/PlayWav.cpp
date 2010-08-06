#include "PlayWav.h"
#include <SoundManager.h>

namespace Amju
{
void PlayWav(const std::string& wavNoFileExt)
{
#ifdef WIN32
  std::string s = "sound/windows/" + wavNoFileExt + ".wav";
  TheSoundManager::Instance()->PlayWav(s);
#endif

#ifdef GEKKO
  std::string s = "sound/wii/" + wavNoFileExt + ".snd";
  TheSoundManager::Instance()->PlayWav(s);
#endif
}
}
