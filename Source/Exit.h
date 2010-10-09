#ifndef EXIT_H
#define EXIT_H

#include "OnFloor.h"
#include "ObjMesh.h"
#include "SceneNode.h"
#include "Billboard.h"
#include "ParticleEffect2d.h"

namespace Amju
{
class SceneMesh;

// Player must go through an exit to go to the next level.
// Different exits go to different levels, allowing non-linear progression.
// Like bonuses, doesn't move with any floor..?

class ExitParticleEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewVel();
  virtual float NewTime();
  virtual void HandleDeadParticle(Particle2d*);
};

// TODO Should cast shadow on Floor, so should be an OnFloor ??
class Exit : public OnFloor
{
public:
  static const char* NAME;

  Exit();
  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File*);
  virtual void Reset();

  // Call when player collides
  void OnPlayerCollision();

  // Call when exit should become visible
  void SetActive();

protected:
  //std::string m_toLevel;
  int m_toLevel;

  bool m_isActive;
  float m_activeTime; // time activated
  float m_rotate;

  // Children of m_pSceneNode
  SceneNode* m_text;
  Billboard* m_billboard; // when activated
  ExitParticleEffect* m_effect; // when activated
};
}

#endif
