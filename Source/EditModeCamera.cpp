#include "EditModeCamera.h"
#include "EventPoller.h"

namespace Amju
{
EditModeCameraController::EditModeCameraController(EditModeCamera* cam) : 
  m_cam(cam)
{
}

EditModeCameraController::~EditModeCameraController()
{
}

EditModeCamera::EditModeCamera()
{
  m_controllable = true;
  m_controller = new EditModeCameraController(this);
  TheEventPoller::Instance()->AddListener(m_controller); 

  // TODO TEMP TEST
  SetEyePos(Vec3f(0, 0, 500));
  SetLookAtPos(Vec3f(0, 0, 0));
  SetUpVec(Vec3f(0, 1, 0));

  m_drag = false;
  m_mode = AMJU_PAN;
}

EditModeCamera::~EditModeCamera()
{
  TheEventPoller::Instance()->RemoveListener(m_controller); 
}

void EditModeCamera::SetControllable(bool controllable)
{
  m_controllable = controllable;
}

void EditModeCamera::Update()
{
}

bool EditModeCamera::OnCursorEvent(const CursorEvent& ce)
{
  static const float SENSITIVITY = 1000.0f;

  static float oldx = ce.x;
  static float oldy = ce.y;
  float dx = ce.x - oldx;
  float dy = ce.y - oldy;
  oldx = ce.x;
  oldy = ce.y;

  if (m_drag && m_controllable)
  {
    switch (m_mode)
    {
    case AMJU_PAN:
      {
        Vec3f forward(m_lookat - m_eye);
        Vec3f up(0, 1, 0);
        Vec3f right = CrossProduct(forward, up);
        right.Normalise();
        Vec3f eyeDiff = right * dx * SENSITIVITY - up * dy * SENSITIVITY;
        m_eye += eyeDiff;
        m_lookat += eyeDiff;
      }
      break;

    case AMJU_ROTATE:
      {
        float angle = dx; // TODO TEMP TEST
        float s = sin(angle);
        float c = cos(angle);
        // Rotate m_eye (x, z) around m_lookat
        m_eye.x = c * (m_eye.x - m_lookat.x) - s * (m_eye.z - m_lookat.z) + m_lookat.x;
        m_eye.z = s * (m_eye.x - m_lookat.x) + c * (m_eye.z - m_lookat.z) + m_lookat.z;
      }
      break;

    case AMJU_ZOOM:
      {
        Vec3f viewVec = m_eye - m_lookat;
        viewVec.Normalise();
        m_eye += viewVec * dy * SENSITIVITY;
      }
      break;
    }
  }
  return false;
}

bool EditModeCamera::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  m_drag = mbe.isDown;
  m_mode = (Mode)mbe.button;
  return false;
}
}

