#ifndef PLAYER_H_INCLUDED
#define PLAYER_H_INCLUDED

#include "EventListener.h"
#include "OnFloor.h"

namespace Amju
{
class Player : public EventListener, public OnFloor
{
public:
  static const char* NAME;

  Player();
  virtual const char* GetTypeName() const;
  virtual void Draw();
  virtual void Update();
  virtual bool Load(File* f);

  virtual void OnButtonEvent(const ButtonEvent& be);
  virtual void OnJoyAxisEvent(const JoyAxisEvent& je);
  virtual void OnKeyEvent(const KeyEvent& ke);
  virtual void OnBalanceBoardEvent(const BalanceBoardEvent& bbe);

  void Jump();

private:
};
}

#endif
