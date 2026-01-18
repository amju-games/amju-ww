#ifndef CAMERA_H
#define CAMERA_H

#include "WWGameObject.h"

namespace Amju
{
class SceneNodeCamera;
class Camera;

class CamBehaviour : public RefCounted
{
public:
  virtual ~CamBehaviour() {}
  virtual void Update(Camera*) = 0;
};
typedef RCPtr<CamBehaviour> PCamBehaviour;

class CamFollowPlayer : public CamBehaviour
{
public:
  virtual void Update(Camera*);
};

class CamZoomInOnPlayer : public CamBehaviour
{
public:
  virtual void Update(Camera*);
};

class Camera : public WWGameObject
{
public:
  static const char* NAME;

  Camera();
  virtual const char* GetTypeName() const;
  virtual void Reset() override;
  virtual void Update();
  virtual bool Load(File*);
  virtual bool Save(File*);

  virtual void AddToGame();
  virtual void RemoveFromGame();

  void SetAsSceneGraphCamera();
  void SetLookAtPos(const Vec3f& v) { m_lookAt = v; }

  void SetBehaviour(CamBehaviour* b) { m_behaviour = b; }

  GameObject* GetTarget() { return m_target; }
  void SetTarget(GameObject* target) { m_target = target; }
 
protected:
  int m_targetId;
  int m_viewportId;
  GameObject* m_target;
  PCamBehaviour m_behaviour;
  Vec3f m_lookAt;
};
}

#endif

