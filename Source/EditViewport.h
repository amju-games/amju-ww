#ifndef EDIT_VIEWPORT_H
#define EDIT_VIEWPORT_H

#include <SceneNodeCamera.h>
#include <GuiText.h>
#include "Viewport.h"

namespace Amju
{
class EditViewport : public Viewport
{
public:
  EditViewport(int id, int x, int y, int w, int h, const std::string& name);
  virtual void Draw() override;
  virtual void Draw2d() override;

  void SetSceneNodeCamera(SceneNodeCamera* cam) { m_cam = cam; }

  bool IsActive() const;
  static void SetActiveId(int activeViewportId);

private:
  RCPtr<SceneNodeCamera> m_cam;
  std::string m_name;
  GuiText m_text;
};
}

#endif
