#ifndef EDIT_VIEWPORT_H
#define EDIT_VIEWPORT_H

#include <SceneNodeCamera.h>
#include <GuiText.h>
#include <GuiRect.h>
#include "Viewport.h"

namespace Amju
{
// ID for each viewport
enum ViewportPos
{
  AMJU_BOTTOM_LEFT,
  AMJU_BOTTOM_RIGHT,
  AMJU_TOP_LEFT,
  AMJU_TOP_RIGHT
};

class EditViewport : public Viewport
{
public:
  EditViewport(int id, float x, float y, float w, float h, const std::string& name);
  virtual void Draw() override;
  virtual void Draw2d() override;

  void SetSceneNodeCamera(SceneNodeCamera* cam) { m_cam = cam; }

  // Convert coord from entire window (-1..1) to this viewport.
  Vec2f ConvertScreenCoord(const Vec2f& screenCoord);

  bool IsActive() const;
  static void SetActiveId(int activeViewportId);

  Vec3f GetMoveAxis(const Vec2f& screenVec);

private:
  RCPtr<SceneNodeCamera> m_cam;
  std::string m_name;
  GuiText m_text;
  GuiRect m_rect[4];
};
}

#endif
