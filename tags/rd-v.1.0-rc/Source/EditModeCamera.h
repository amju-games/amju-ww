#ifndef EDIT_MODE_CAMERA_H
#define EDIT_MODE_CAMERA_H

#include <SceneNodeCamera.h>
#include <EventListener.h>

namespace Amju
{
class EditModeCameraController;

enum EditCamType { 
  AMJU_EDITCAM_FRONT,
  AMJU_EDITCAM_SIDE,
  AMJU_EDITCAM_TOP,
  AMJU_EDITCAM_PERSP
};

class EditModeCamera : public SceneNodeCamera
{
public:
  EditModeCamera(EditCamType type);
  virtual ~EditModeCamera();

  virtual void Update() override;
  virtual void Draw() override;

  bool OnCursorEvent(const CursorEvent&); 
  bool OnMouseButtonEvent(const MouseButtonEvent&);
  bool OnKeyEvent(const KeyEvent& ke);

  void SetControllable(bool controllable);

  enum Mode { AMJU_PAN, AMJU_ROTATE, AMJU_ZOOM };
  void SetMode(Mode mode);
  Mode GetMode() const;

  void SetIsActive(bool);
  bool IsActive() const;

private:
  bool m_drag;
  Mode m_mode;
  RCPtr<EditModeCameraController> m_controller;
  bool m_isActive; // if false we ignore all events
  bool m_controllable; // Camera may be active but not controllable because we are dragging an object
  EditCamType m_camType;
  float m_oldx, m_oldy;
  float m_scale; // zoom for ortho projections
};

class EditModeCameraController : public EventListener
{
public:
  EditModeCameraController(EditModeCamera* cam);
  ~EditModeCameraController();

  virtual bool OnCursorEvent(const CursorEvent& ce) override { return m_cam->OnCursorEvent(ce); }
  virtual bool OnMouseButtonEvent(const MouseButtonEvent& mbe) override { return m_cam->OnMouseButtonEvent(mbe); }
  virtual bool OnKeyEvent(const KeyEvent& ke) override { return m_cam->OnKeyEvent(ke); }

private:
  EditModeCamera* m_cam;
};
}

#endif
