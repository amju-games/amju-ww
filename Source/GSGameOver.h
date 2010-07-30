#ifndef GAME_OVER_STATE_H
#define GAME_OVER_STATE_H

#include "GSText.h"

namespace Amju
{
class GSGameOver : public GSText
{
public:
  static const char* NAME;

  GSGameOver();

  // GameState overrides
  virtual void OnActive();
  virtual void Update();
};
}

#endif
