#include <FileImplGlue.h>
#include <iOSUtils.h>
#include "WWLoadGui.h"

namespace Amju
{
static PGuiElement LoadGuiWithPrefix(const std::string& prefix, const std::string& filename, bool addAsListener)
{
  // TODO This won't work with paths, but all gui files are at top level
  //  of glue file for this game.
  std::string testFile = prefix + filename;
  if (FileImplGlue::GetGlueFile()->FileExists(testFile))
  {
    PGuiElement e = Amju::LoadGui(testFile, addAsListener);
    return e;
  }
  return nullptr;
}
  
PGuiElement WWLoadGui(const std::string& filename, bool addAsListener)
{
#ifdef AMJU_IOS

  // Fall back to base version of file if the exact one we
  //  want is  not there
  static iOSDeviceType dt = GetDeviceType();
  if (dt == AMJU_IPAD)
  {
    auto e = LoadGuiWithPrefix("ipad-", filename, addAsListener);
    if (e)
    {
      return e;
    }
    // Try other iOS layout in preference to common?
    // TODO
  }
  else if (dt == AMJU_IPHONE)
  {
    auto e = LoadGuiWithPrefix("iphone-", filename, addAsListener);
    if (e)
    {
      return e;
    }
  }
#endif

  return Amju::LoadGui(filename, addAsListener);
}
}

