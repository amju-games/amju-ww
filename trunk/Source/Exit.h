#ifndef EXIT_H
#define EXIT_H

#include "GameObject.h"
#include "ObjMesh.h"
#include "SceneNode.h"
#include "Billboard.h"
#include "ParticleEffect2d.h"

namespace Amju
{
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
class Exit : public GameObject
{
public:
  static const char* NAME;

  Exit();
  virtual const char* GetTypeName() const;
  virtual void Draw();
  virtual void Update();
  virtual bool Load(File*);
  virtual void Reset();

  // Call when player collides
  // TODO explosion effect ?
  void OnPlayerCollision();

  // Call when exit should become visible
  // TODO Maybe a timer ?
  void SetActive();

protected:
  std::string m_toLevel;
  bool m_isActive;
  PObjMesh m_mesh;
  float m_rotate;
  PSceneNode m_text;
  Billboard m_billboard; // when activated
  ExitParticleEffect m_effect; // when activated
  float m_activeTime; // time activated
};
}

#endif

