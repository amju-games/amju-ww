#ifndef CAMERA_H
#define CAMERA_H

#include "GameObject.h"

namespace Amju
{
class SceneNodeCamera;

// Keep looking at a Player
class Camera : public GameObject
{
public:
  static const char* NAME;

  Camera();
  virtual const char* GetTypeName() const;
  virtual void Reset();
  virtual void Update();
  virtual bool Load(File*);

  void SetAsSceneGraphCamera();

protected:
  int m_targetId;
  int m_viewportId;
  PGameObject m_target;
  RCPtr<SceneNodeCamera> m_pSceneNode;
};
}

#endif

