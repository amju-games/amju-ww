#include <iOSUtils.h>
#include "WWLoadGui.h"

namespace Amju
{
PGuiElement WWLoadGui(const std::string& filename, bool addAsListener)
{
#ifdef AMJU_IOS

  // Fall back to base version of file if the exact one we 
  //  want is  not there
  static iOSDeviceType dt = GetDeviceType();
  if (dt == AMJU_IPAD)
  {
    // TODO This won't work with paths, but all gui files are at top level
    //  of glue file for this game.
    PGuiElement e = Amju::LoadGui("ipad-" + filename, addAsListener);
    if (e)
    {
      return e;
    }
  }
  else if (dt == AMJU_IPHONE)
  {
    PGuiElement e = Amju::LoadGui("iphone-" + filename, addAsListener);
    if (e)
    {
      return e;
    }
  }
#endif

  return Amju::LoadGui(filename, addAsListener);
}
}

