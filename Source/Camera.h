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
  CamFollowPlayer() : m_petDist(0) {}
  virtual void Update(Camera*);

private:
  float m_petDist; // distance proportional to number of pets carried,
    // but changes gradually over frames
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
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Reset() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void AddToGame() override;
  virtual void RemoveFromGame() override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);

  void SetAsSceneGraphCamera();
  void SetLookAtPos(const Vec3f& v) { m_lookAt = v; }

  void SetBehaviour(CamBehaviour* b) { m_behaviour = b; }

  GameObject* GetTarget() { return m_target; }
  void SetTarget(GameObject* target) { m_target = target; }

  void SetEarthquake(float severity);
  
protected:
  int m_targetId;
  int m_viewportId;
  GameObject* m_target;
  PCamBehaviour m_behaviour;
  Vec3f m_lookAt;
  float m_earthquakeSeverity;
};

Camera* GetActiveCamera();
}

#endif

