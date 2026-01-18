#ifndef BALANCE_GAME_STATE_H
#define BALANCE_GAME_STATE_H

#include <vector>
#include "GameState.h"
#include <EventListener.h>
#include "Viewport.h"
#include <Singleton.h>

namespace Amju
{
class Floor;

class GSMainEventListener : public EventListener
{
public:
  // EventListener overrides
  virtual bool OnKeyEvent(const KeyEvent&);
};

class GSMain : public GameState, public NonCopyable
{
protected:
  GSMain();
  friend class Singleton<GSMain>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

  void ClearLevel();

  void OnExitReached();

protected:
  bool m_exitReached;
  float m_exitTimer;
};
typedef Singleton<GSMain> TheGSMain;
}

#endif
