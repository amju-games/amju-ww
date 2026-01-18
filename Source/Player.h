#ifndef PLAYER_H_INCLUDED
#define PLAYER_H_INCLUDED

#include "EventListener.h"
#include "OnFloorCharacter.h"

namespace Amju
{
class Player : public EventListener, public OnFloorCharacter
{
public:
  static const char* NAME;

  Player();
  // ID of player - 0 for single player, 0 or 1 for two-player, etc.
  void SetPlayerId(int);
  int GetPlayerId() const;

  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File* f);

  virtual bool OnButtonEvent(const ButtonEvent& be);
  virtual bool OnJoyAxisEvent(const JoyAxisEvent& je);
  virtual bool OnKeyEvent(const KeyEvent& ke);
  virtual bool OnBalanceBoardEvent(const BalanceBoardEvent& bbe);
  virtual bool OnRotationEvent(const RotationEvent&);

  void Jump();

private:
  // PlayerInfo ID
  int m_playerId;
  // Start position for current level
  Vec3f m_startPos;
};
}

#endif
