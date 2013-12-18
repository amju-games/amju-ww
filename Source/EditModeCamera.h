#ifndef EDIT_MODE_CAMERA_H
#define EDIT_MODE_CAMERA_H

#include "SceneNodeCamera.h"
#include "EventListener.h"

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

  virtual void Update();
  virtual void Draw();

  virtual bool OnCursorEvent(const CursorEvent&); 
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&);

  void SetControllable(bool controllable);

  enum Mode { AMJU_PAN, AMJU_ROTATE, AMJU_ZOOM };
  void SetMode(Mode mode);
  Mode GetMode() const;

private:
  bool m_drag;
  Mode m_mode;
  RCPtr<EditModeCameraController> m_controller;
  bool m_controllable;
  EditCamType m_camType;
};

class EditModeCameraController : public EventListener
{
public:
  EditModeCameraController(EditModeCamera* cam);
  ~EditModeCameraController();

  virtual bool OnCursorEvent(const CursorEvent& ce) override { return m_cam->OnCursorEvent(ce); }
  virtual bool OnMouseButtonEvent(const MouseButtonEvent& mbe) override { return m_cam->OnMouseButtonEvent(mbe); }

private:
  EditModeCamera* m_cam;
};
}

#endif
