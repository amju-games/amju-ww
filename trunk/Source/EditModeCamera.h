#ifndef EDIT_MODE_CAMERA_H
#define EDIT_MODE_CAMERA_H

#include "SceneNodeCamera.h"
#include "EventListener.h"

namespace Amju
{
class EditModeCamera : public SceneNodeCamera, public EventListener
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
};
}

#endif
