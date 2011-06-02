#include "Camera.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "AmjuGL.h"
#include "Game.h"
#include "Timer.h"
#include "SceneNodeCamera.h"
#include "MySceneGraph.h"
#include "OnFloor.h"
#include "Viewport.h"

namespace Amju
{
GameObject* CreateCamera() { return new Camera; }
static bool reg = TheGameObjectFactory::Instance()->Add(Camera::NAME, &CreateCamera);

const char* Camera::NAME = "camera";

static const float Y_OFFSET = 200.0f;
static const float Z_OFFSET = 200.0f;

Viewport* GetViewport(int i)
{
  return TheViewportManager::Instance()->GetViewport(i);
}

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
/*
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
*/

void Camera::Update()
{
  if (!m_pSceneNode)
  {
    return;
  }

  GameObject::Update();

  if (!m_target)
  {
    Reset();
  }

  Assert(m_target);
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
  if (!((OnFloor*)m_target.GetPtr())->IsFalling())
  {
    m_pos.y = v.y + Y_OFFSET;
  }

  // Z is fixed distance from player
  m_pos.z = v.z + Z_OFFSET;

  /*
  const Vec3f& v = m_target->GetPos();
  // Don't set Identity - camera can be attached to something; multiple cameras..?
  AmjuGL::LookAt(
    m_pos.x, m_pos.y, m_pos.z,  // eye
    m_pos.x, v.y, v.z,  // target -- NB always look straight ahead, so x is the same
    0, 1.0f, 0); // up
  */
  Assert(dynamic_cast<SceneNodeCamera*>(GetSceneNode()));
  SceneNodeCamera* c = ((SceneNodeCamera*)GetSceneNode());
  c->SetEyePos(m_pos);
  c->SetLookAtPos(Vec3f(m_pos.x, v.y, v.z));
  c->SetUpVec(Vec3f(0, 1, 0)); 
}

bool Camera::Load(File* f)
{
  if (!GameObject::Load(f)) // Load ID
  {
    return false;
  }

  // TODO Do we need to store it ? Or just use ID to get ptr to Viewport ?
  if (!f->GetInteger(&m_viewportId))
  {
    f->ReportError("Expected viewport ID");
    return false;
  }

  if (!f->GetInteger(&m_targetId))
  {
    f->ReportError("Expected target ID");
    return false;
  }

  Viewport* vp = GetViewport(m_viewportId);
  if (!vp)
  {
    // No viewport for this ID. No need to create this camera.
    return true;
  }
  m_pSceneNode = new SceneNodeCamera;
  vp->SetCamera(this);

  return true;
}

void Camera::SetAsSceneGraphCamera()
{
  Assert(dynamic_cast<SceneNodeCamera*>(GetSceneNode()));
  GetGameSceneGraph()->SetCamera((SceneNodeCamera*)GetSceneNode());
}
}
