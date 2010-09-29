#ifndef GS_EDIT_MENU_H
#define GS_EDIT_MENU_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSEditMenu : public GSText, public NonCopyable
{
private:
  GSEditMenu() {}
  friend class Singleton<GSEditMenu>;

public:
  static const char* NAME;

  // GSText overrides
  virtual void OnActive();
};
typedef Singleton<GSEditMenu> TheGSEditMenu;
}

#endif

