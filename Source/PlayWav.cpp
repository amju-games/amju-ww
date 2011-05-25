#include <iostream>
#include "PlayWav.h"
#include <SoundManager.h>

namespace Amju
{
void PlayWav(const std::string& wavNoFileExt)
{
#ifdef GEKKO
  std::string s = "sound/wii/" + wavNoFileExt + ".snd";
#else
  std::string s = "sound/windows/" + wavNoFileExt + ".wav";
#endif

//#ifdef _DEBUG
  std::cout << "Playing sound: " << s << "\n";
//#endif

  TheSoundManager::Instance()->PlayWav(s);
}
}
