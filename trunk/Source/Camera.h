#ifndef CAMERA_H
#define CAMERA_H

#include "GameObject.h"

namespace Amju
{
// Keep looking at Player
class Camera : public GameObject
{
public:
  static const char* NAME;

  Camera();
  virtual const char* GetTypeName() const;
  virtual void Reset();
  virtual void Draw();
  virtual void Update();
  virtual bool Load(File*);

protected:
  int m_targetId;
  PGameObject m_target;
};
}

#endif

