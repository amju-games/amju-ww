#ifndef GS_MENU_H
#define GS_MENU_H

#include "GSText.h"

namespace Amju
{
class GSMenu : public GSText
{
public:
  static const char* NAME;

  // GSText overrides
  virtual void OnActive();
};
}

#endif


