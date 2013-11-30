#ifndef EXIT_H
#define EXIT_H

#include "StaticFloor.h"
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
  ExitParticleEffect();
  virtual Vec3f NewPos() const;
  virtual Vec3f NewVel() const;
  virtual float NewTime() const;
  virtual void HandleDeadParticle(Particle2d*);
};

// TODO Should cast shadow on Floor, so should be an OnFloor ??
class Exit : public StaticFloor
{
public:
  static const char* NAME;

  Exit();
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual void Update();
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Reset();

  virtual void AddToGame() override;
  virtual void RemoveFromGame() override;
  virtual bool CreateSceneNode() override;

  // Call when player collides
  void OnPlayerCollision();

  // Call when exit should become visible
  void SetActive();

  // Returns true when we are about to go to next level
  bool IsExiting() const { return m_isExiting; }

protected:
  //std::string m_toLevel;
  int m_toLevel;

  bool m_isActive; // can be used
  float m_activeTime; // time activated
  float m_rotate;

  // Children of m_pSceneNode
  SceneNode* m_cylinder;
  SceneNode* m_text;
  Billboard* m_billboard; // when activated
  ExitParticleEffect* m_effect; // when activated

  bool m_isExiting; // is active and player has collided, so we are going to the next level
};
}

#endif

