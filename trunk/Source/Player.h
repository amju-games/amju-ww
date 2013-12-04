#ifndef PLAYER_H_INCLUDED
#define PLAYER_H_INCLUDED

#include <list>
#include "EventListener.h"
#include "OnFloorCharacter.h"
#include "PlayerNum.h"

namespace Amju
{
class PlayerController;
class Pet;
typedef std::list<Pet*> PetList;

class Player : public OnFloorCharacter
{
public:
  static Player* GetPlayer(PlayerNum pn);

  static const char* NAME;

  Player();
  virtual ~Player();

  // ID of player - 0 for single player, 0 or 1 for two-player, etc.
  void SetPlayerId(int);
  int GetPlayerId() const;

  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual void Update();
  virtual bool Load(File* f);
  virtual bool Save(File* f);
  virtual void Reset() override;

  virtual bool OnButtonEvent(const ButtonEvent& be);
  virtual bool OnJoyAxisEvent(const JoyAxisEvent& je);
  virtual bool OnKeyEvent(const KeyEvent& ke);
  virtual bool OnBalanceBoardEvent(const BalanceBoardEvent& bbe);
  virtual bool OnRotationEvent(const RotationEvent&);

  virtual void OnAnimFinished();

  void Jump();

  void PickUpPet(Pet* pet);
  const PetList& GetPets() const { return m_pets; }
  void DropPets();

  // Call when we collide with exit
  void ReachedExit();

private:
  void UpdatePets();
 
private:
  // PlayerInfo ID
  int m_playerId;

  RCPtr<PlayerController> m_controller;

  // Pets picked up
  PetList m_pets;
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
