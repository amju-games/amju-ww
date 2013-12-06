#include "EditModeCamera.h"
#include "EventPoller.h"

//#define EMC_DEBUG

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
  if (!m_controller)
  {
    m_controller = new EditModeCameraController(this);
  }
  TheEventPoller::Instance()->AddListener(m_controller, 100); // low pri 

  // TODO TEMP TEST
  SetEyePos(Vec3f(0, 0, 500));
  SetLookAtPos(Vec3f(0, 0, 0));
  SetUpVec(Vec3f(0, 1, 0));

  m_drag = false;
  m_mode = AMJU_ROTATE;
}

EditModeCamera::~EditModeCamera()
{
  TheEventPoller::Instance()->RemoveListener(m_controller); 
}
  
EditModeCamera::Mode EditModeCamera::GetMode() const
{
  return m_mode;
}

void EditModeCamera::SetMode(Mode mode)
{
#ifdef EMC_DEBUG
std::cout << "Edit Cam: Setting mode to ";
switch (mode)
{
case AMJU_ROTATE:
  std::cout << "Rotate\n";
  break;
case AMJU_PAN:
  std::cout << "Pan\n";
  break;
case AMJU_ZOOM:
  std::cout << "Zoom\n";
  break;
};
#endif

  m_mode = mode;
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

  if (m_drag)
  {
#ifdef EMC_DEBUG
std::cout << "Drag camera\n";
#endif

    switch (m_mode)
    {
    case AMJU_PAN:
      if (m_controllable)
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
      // always allow //if (m_controllable)
      {
        float angleX = dx; // TODO TEMP TEST
        float angleY = dy * 1000.0f;

        float sx = sin(angleX);
        float cx = cos(angleX);
        // Rotate m_eye (x, z) around m_lookat
        m_eye.x = cx * (m_eye.x - m_lookat.x) - sx * (m_eye.z - m_lookat.z) + m_lookat.x;
        m_eye.y += angleY;
        m_eye.z = sx * (m_eye.x - m_lookat.x) + cx * (m_eye.z - m_lookat.z) + m_lookat.z;
      }
/*
      else
      {
#ifdef EMC_DEBUG
std::cout << "Edit cam: not controllable\n";
#endif
      }
*/
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
#ifdef EMC_DEBUG
std::cout << "Edit camera mouse button " << (mbe.isDown ? "DOWN" : "UP") << "\n";
#endif

  m_drag = mbe.isDown;
  // Hmm, maybe?
  m_mode = (Mode)mbe.button;
  return false;
}
}

