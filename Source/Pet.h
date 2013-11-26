#ifndef PET_H
#define PET_H

#include <SceneMesh.h>
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
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void AddToGame() override;

  virtual void OnAnimFinished() override;

  void StartBeingEaten(Dino* eater);
  bool CanBeEaten() const;
  bool JustDropped() const;
  void SetCarryingPlayer(Player* player);
  Player* GetCarryingPlayer();

protected:
  enum EatenState { NOT_EATEN_YET, BEING_EATEN, HAS_BEEN_EATEN };
  EatenState m_eatenState;
 
  float m_eatenTime;
  float m_justDroppedTime;
  bool m_justDropped;

  RCPtr<SceneMesh> m_bloodPool;
  Vec3f m_bloodPoolPos;
  Vec2f m_bloodPoolXZSize;
  float m_bloodPoolScale;
  RCPtr<BloodFx> m_bloodFx;

  Player* m_carryingPlayer;
};
}

#endif
