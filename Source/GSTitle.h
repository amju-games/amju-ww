#ifndef TITLE_GAME_STATE_H
#define TITLE_GAME_STATE_H

#include "GSText.h"

namespace Amju
{
class GSTitle : public GSText
{
public:
  static const char* NAME;

  GSTitle();

  // GSText overrides
  virtual void OnActive();
};
}

#endif
