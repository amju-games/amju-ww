#ifndef GS_MENU_H
#define GS_MENU_H

#include "GSText.h"

namespace Amju
{
class GSMenu : public GSText, public NonCopyable
{
private:
  GSMenu() {}
  friend class Singleton<GSMenu>;

public:
  static const char* NAME;

  // GSText overrides
  virtual void OnActive();
};
typedef Singleton<GSMenu> TheGSMenu;
}

#endif


