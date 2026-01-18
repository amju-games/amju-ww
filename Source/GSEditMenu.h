#ifndef GS_EDIT_MENU_H
#define GS_EDIT_MENU_H

#include "GSText.h"

namespace Amju
{
class GSEditMenu : public GSText
{
public:
  static const char* NAME;

  // GSText overrides
  virtual void OnActive();
};
}

#endif

