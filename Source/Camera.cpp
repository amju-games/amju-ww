#include "Camera.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "AmjuGL.h"
#include "Game.h"
#include "Timer.h"
#include "Animated.h"

namespace Amju
{
GameObject* CreateCamera() { return new Camera; }
static bool reg = TheGameObjectFactory::Instance()->Add(Camera::NAME, &CreateCamera);

const char* Camera::NAME = "camera";

static const float Y_OFFSET = 200.0f;
static const float Z_OFFSET = 200.0f;

Camera::Camera()
{
  m_targetId = -1;
  m_target = 0;
}

const char* Camera::GetTypeName() const
{
  return NAME;
}

void Camera::Reset()
{
  if (!m_target)
  {
    m_target = TheGame::Instance()->GetGameObject(m_targetId);
    Assert(m_target);
  }

  const Vec3f& v = m_target->GetPos();
  m_pos = Vec3f(v.x, v.y + Y_OFFSET, v.z + Z_OFFSET);
}

void Camera::Draw()
{
  if (!m_target)
  {
    Reset();
  }

  const Vec3f& v = m_target->GetPos();
  // Don't set Identity - camera can be attached to something; multiple cameras..?
  AmjuGL::LookAt(
    m_pos.x, m_pos.y, m_pos.z,  // eye
    m_pos.x, v.y, v.z,  // target -- NB always look straight ahead, so x is the same
    0, 1.0f, 0); // up
}

void Camera::Update()
{
  GameObject::Update();

  const Vec3f& v = m_target->GetPos();

  static const float CAM_SPEED = 400.0f; // TODO CONFIG
  static const float CAM_ACC = CAM_SPEED * 2.5f;
  // TODO Move in x if too far left/right
  static const float TOO_FAR = 100.0f;
  if (v.x > (m_pos.x + TOO_FAR))
  {
    m_vel.x = CAM_SPEED;
    m_acc.x = -CAM_ACC;
  }
  else if (v.x < (m_pos.x - TOO_FAR))
  {
    m_vel.x = -CAM_SPEED;
    m_acc.x = CAM_ACC;
  }

  // Prevent changing direction
  static const float STOP = 10.0f; 
  if (fabs(m_vel.x) < STOP)
  {
    m_vel.x = 0;
    m_acc.x = 0;
  }

  // Move in Y - but don't move in y if player is falling
  if (!((Animated*)m_target.GetPtr())->IsFalling())
  {
    m_pos.y = v.y + Y_OFFSET;
  }

  // Z is fixed distance from player
  m_pos.z = v.z + Z_OFFSET;
}

bool Camera::Load(File* f)
{
  if (!GameObject::Load(f)) // Load ID
  {
    return false;
  }

  if (!f->GetInteger(&m_targetId))
  {
    f->ReportError("Expected target ID");
    return false;
  }
  return true;
}
}
