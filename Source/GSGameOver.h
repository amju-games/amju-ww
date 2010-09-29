#ifndef GAME_OVER_STATE_H
#define GAME_OVER_STATE_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSGameOver : public GSText, public NonCopyable
{
private:
    GSGameOver();
    friend class Singleton<GSGameOver>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive();
  virtual void Update();
};
typedef Singleton<GSGameOver> TheGSGameOver;
}

#endif
