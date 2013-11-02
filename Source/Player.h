#ifndef PLAYER_H_INCLUDED
#define PLAYER_H_INCLUDED

#include "EventListener.h"
#include "OnFloorCharacter.h"

namespace Amju
{
class PlayerController;

class Player : public OnFloorCharacter
{
public:
  static const char* NAME;

  Player();
  virtual ~Player();

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

  void AddSceneNode();

private:
  // PlayerInfo ID
  int m_playerId;
  // Start position for current level
  Vec3f m_startPos;

  RCPtr<PlayerController> m_controller;
};

// Pass events on to the Player - TODO Send messages so will work over network
class PlayerController : public EventListener
{
public:
  PlayerController(Player* player) : m_player(player) {}

  virtual bool OnButtonEvent(const ButtonEvent& be) override { return m_player->OnButtonEvent(be); }
  virtual bool OnJoyAxisEvent(const JoyAxisEvent& je) override { return m_player->OnJoyAxisEvent(je); }
  virtual bool OnKeyEvent(const KeyEvent& ke) override { return m_player->OnKeyEvent(ke); }
  virtual bool OnBalanceBoardEvent(const BalanceBoardEvent& bbe) override { return m_player->OnBalanceBoardEvent(bbe); }
  virtual bool OnRotationEvent(const RotationEvent& re) override { return m_player->OnRotationEvent(re); }

private:
  Player* m_player;
};

}

#endif
