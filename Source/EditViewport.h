#ifndef EDIT_VIEWPORT_H
#define EDIT_VIEWPORT_H

#include <SceneNodeCamera.h>
#include "Viewport.h"

namespace Amju
{
class EditViewport : public Viewport
{
public:
  EditViewport(int id, int x, int y, int w, int h);
  virtual void Draw() override;
  virtual void Draw2d() override;

  void SetSceneNodeCamera(SceneNodeCamera* cam) { m_cam = cam; }

private:
  RCPtr<SceneNodeCamera> m_cam;
};
}

#endif
