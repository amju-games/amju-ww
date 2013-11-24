#ifndef PET_H
#define PET_H

#include "Npc.h"
#include "BloodFx.h"

namespace Amju
{
class Player;
class Dino;

class Pet : public Npc
{
public:
  static const char* NAME;

  Pet();
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual void Update();
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void AddToGame() override;

  void StartBeingEaten(Dino* eater);
  bool CanBeEaten() const;

  void SetCarryingPlayer(Player* player);
  Player* GetCarryingPlayer();

protected:
  enum EatenState { NOT_EATEN_YET, BEING_EATEN, HAS_BEEN_EATEN };
  EatenState m_eatenState;
 
  float m_eatenTime;

  Shadow* m_bloodPool;
  RCPtr<BloodFx> m_bloodFx;

  Player* m_carryingPlayer;
};
}

#endif
