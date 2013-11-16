#ifndef BONUS_H
#define BONUS_H

#include "OnFloor.h"
#include "BonusParticleEffect.h"

namespace Amju
{
class Player;

// Float in the air - don't move with any floor, but do cast a shadow
class Bonus : public OnFloor
{
public:
  static const char* NAME;

  Bonus();
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual bool Save(File* f);
  virtual void Update(); // NB Don't move with floor!

  void OnPlayerCollision(Player*);

protected:
  bool m_isCollected;
  float m_yRot;
  BonusParticleEffect* m_effect; // Child of scene node
  int m_points;
  int m_lives;
};
}

#endif

