#ifndef GS_PAUSED_H
#define GS_PAUSED_H

#include "GSText.h"

namespace Amju
{
class GSPaused : public GSText
{
public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive();
  //virtual void OnDeactive();
  //virtual void Update();
};
}

#endif

