#ifndef BALANCE_GAME_STATE_H
#define BALANCE_GAME_STATE_H

#include "GameState.h"

namespace Amju
{
class Floor;

class GSMain : public GameState
{
public:
  static const char* NAME;

  GSMain();

  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

  // EventListener overrides
  virtual void OnKeyEvent(const KeyEvent&);
  // TODO TEMP TEST to test Wii rotation events
  virtual void OnRotationEvent(const RotationEvent&);

  void ClearLevel();

protected:
};
}

#endif
