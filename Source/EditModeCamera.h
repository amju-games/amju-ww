#ifndef EDIT_MODE_CAMERA_H
#define EDIT_MODE_CAMERA_H

#include "SceneNodeCamera.h"
#include "EventListener.h"

namespace Amju
{
class EditModeCameraController;

class EditModeCamera : public SceneNodeCamera
{
public:
  EditModeCamera();
  virtual ~EditModeCamera();

  virtual void Update();

  virtual bool OnCursorEvent(const CursorEvent&); 
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&);

private:
  bool m_drag;
  enum Mode { AMJU_PAN, AMJU_ROTATE, AMJU_ZOOM };
  Mode m_mode;
  RCPtr<EditModeCameraController> m_controller;
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
