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
  virtual void OnActive() override;
  virtual void Update() override;
  virtual void Draw2d() override;

  virtual bool OnKeyEvent(const KeyEvent&) override;
  virtual bool OnButtonEvent(const ButtonEvent&) override;
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&) override;
};
typedef Singleton<GSGameOver> TheGSGameOver;
}

#endif
