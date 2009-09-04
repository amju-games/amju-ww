#ifndef BONUS_H
#define BONUS_H

#include "OnFloor.h"
#include "BonusParticleEffect.h"

namespace Amju
{
class SceneMesh;

// Float in the air - don't move with any floor, but do cast a shadow
class Bonus : public OnFloor
{
public:
  static const char* NAME;

  Bonus();
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual void Update(); // NB Don't move with floor!
  //virtual AABB* GetAABB(); 

  void OnPlayerCollision();

protected:
  bool m_isCollected;
  float m_yRot;
  //SceneMesh* m_pSceneNode;
  BonusParticleEffect* m_effect; // Child of scene node
};
}

#endif

