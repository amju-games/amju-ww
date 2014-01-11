#include <AmjuGL.h>
#include "EditModeCamera.h"
#include "EventPoller.h"
#include "Describe.h"

#define EMC_DEBUG

namespace Amju
{
EditModeCameraController::EditModeCameraController(EditModeCamera* cam) : 
  m_cam(cam)
{
}

EditModeCameraController::~EditModeCameraController()
{
}

EditModeCamera::EditModeCamera(EditCamType camType)
{
  float SCALE = 0.002f; // TODO CONFIG
  m_scale = SCALE;
  m_oldx = 0;
  m_oldy = 0;
  m_camType = camType;
  m_controllable = false; // Press special key to make controllable
  m_isActive = false;

  m_controller = new EditModeCameraController(this);
  
  TheEventPoller::Instance()->AddListener(m_controller, 90); // low pri 

  // TODO TEMP TEST
  Vec3f eye(0, 0, 300);
  Vec3f up(0, 1, 0);
  if (m_camType == AMJU_EDITCAM_SIDE)
  {
    eye = Vec3f(300, 0, 0); // TODO CONFIG - maybe save in Game Config file
  }
  else if (m_camType == AMJU_EDITCAM_TOP)
  {
    eye = Vec3f(0, 300, 0);
    up = Vec3f(0, 0, -1);
  }

  SetEyePos(eye);
  SetLookAtPos(Vec3f(0, 0, 0));
  SetUpVec(up);

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

void EditModeCamera::SetIsActive(bool isActive)
{
  m_isActive = isActive;
}

bool EditModeCamera::IsActive() const
{
  return m_isActive;
}

void EditModeCamera::SetControllable(bool controllable)
{
  m_controllable = controllable;
}

void EditModeCamera::Update()
{
}

void EditModeCamera::Draw()
{
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  if (m_camType == AMJU_EDITCAM_PERSP)
  {
    const float FOVY = 60.0f;
    const float NEAR = 1.0f;
    const float FAR = 3000.0f;
    const float ASPECT = 1.5f; // Always show the same amount of the world,
      // but distorted if viewport does not have this aspect ratio
    AmjuGL::SetPerspectiveProjection(FOVY, ASPECT, NEAR, FAR);
  }
  else
  {
    AmjuGL::Translate(0, 0, -0.5f);
    AmjuGL::Scale(m_scale, m_scale, m_scale * -0.001f);
  }

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  SceneNodeCamera::Draw(); // look at
}

bool EditModeCamera::OnCursorEvent(const CursorEvent& ce)
{
  static const float SENSITIVITY = 1000.0f;

  // Initialise old values on first call... this is no good, it only works for one camera
  static float oldxInit = (m_oldx = ce.x);
  static float oldyInit = (m_oldy = ce.y);

  float dx = ce.x - m_oldx;
  float dy = ce.y - m_oldy;
  m_oldx = ce.x;
  m_oldy = ce.y;

  if (!IsActive())
  {
    return false;
  }

  if (m_drag)
  {
#ifdef EMC_DEBUG
std::cout << "Drag mouse... camera: " <<
  (m_mode == AMJU_PAN ? "PAN" : (m_mode == AMJU_ROTATE ? "ROTATE" : "ZOOM"))
   << "\n";
#endif

    switch (m_mode)
    {
    case AMJU_PAN:
      if (m_controllable)
      {
        Vec3f forward(m_lookat - m_eye);
        Vec3f up(0, 1, 0);
        if (m_camType == AMJU_EDITCAM_TOP)
        {
          up = Vec3f(0, 0, 1); // TODO TEMP TEST
        }
        Vec3f right = CrossProduct(forward, up);
        right.Normalise();
        Vec3f eyeDiff = right * dx * SENSITIVITY - up * dy * SENSITIVITY;
        m_eye += eyeDiff;
        m_lookat += eyeDiff;

std::cout << "Eye Diff: " << Describe(eyeDiff) << "\n";
      }
      break;

    case AMJU_ROTATE:
      if (m_camType == AMJU_EDITCAM_PERSP) // always allow //if (m_controllable)
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
      if (m_camType == AMJU_EDITCAM_PERSP)
      {
        Vec3f viewVec = m_eye - m_lookat;
        viewVec.Normalise();
        m_eye += viewVec * dy * SENSITIVITY;
      }
      else
      {
        m_scale *= (1.0f + dy); // TODO TEMP TEST
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

bool EditModeCamera::OnKeyEvent(const KeyEvent& ke)
{
  // Only move camera when special key held down, so we can also drag mouse to select etc.
  if (ke.keyType == AMJU_KEY_SPACE) // TODO
  {
    m_controllable = ke.keyDown;
    return true;
  }
  return false;
}

}

