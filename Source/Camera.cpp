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
static const float Z_OFFSET = 300.0f;

Viewport* GetViewport(int i)
{
  return TheViewportManager::Instance()->GetViewport(i);
}

void CamZoomInOnPlayer::Update(Camera* cam)
{
  Assert(cam);
  Assert(cam->GetTarget());
  const Vec3f& v = cam->GetTarget()->GetPos();
  Vec3f pos = cam->GetPos();
  
  // Get closer to player
  Vec3f vel = v - pos;

  cam->SetVel(vel);
  cam->SetLookAtPos(v); 
}

void CamFollowPlayer::Update(Camera* cam)
{
  Assert(cam);
  Assert(cam->GetTarget());

  const Vec3f& v = cam->GetTarget()->GetPos();
  Vec3f pos = cam->GetPos();
  Vec3f vel = cam->GetVel();
  Vec3f acc = cam->GetAcc();

  static const float CAM_SPEED = 400.0f; // TODO CONFIG
  static const float CAM_ACC = CAM_SPEED * 2.5f;
  // TODO Move in x if too far left/right
  static const float TOO_FAR = 100.0f;
  if (v.x > (pos.x + TOO_FAR))
  {
    vel.x = CAM_SPEED;
    acc.x = -CAM_ACC;
  }
  else if (v.x < (pos.x - TOO_FAR))
  {
    vel.x = -CAM_SPEED;
    acc.x = CAM_ACC;
  }

  // Prevent changing direction
  static const float STOP = 10.0f; 
  if (fabs(vel.x) < STOP)
  {
    vel.x = 0;
    acc.x = 0;
  }

  // Move in Y - but don't move in y if player is falling
  if (!((OnFloor*)cam->GetTarget())->IsFalling())
  {
    pos.y = v.y + Y_OFFSET;
  }

  // Z is fixed distance from player
  pos.z = v.z + Z_OFFSET;

  cam->SetPos(pos);
  cam->SetVel(vel);
  cam->SetAcc(acc);
  cam->SetLookAtPos(Vec3f(pos.x, v.y, v.z));
}

Camera::Camera()
{
  m_targetId = -1;
  m_target = 0;

  m_behaviour = new CamFollowPlayer;
  //m_behaviour = new CamZoomInOnPlayer;
}

const char* Camera::GetTypeName() const
{
  return NAME;
}

void Camera::Reset()
{
  if (!m_target)
  {
std::cout << "Camera obj ID: " << GetId() << " target ID: " << m_targetId << "\n";

    m_target = TheGame::Instance()->GetGameObject(m_targetId);
    Assert(m_target);
  }

  const Vec3f& v = m_target->GetPos();
  m_pos = Vec3f(v.x, v.y + Y_OFFSET, v.z + Z_OFFSET);
}

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

  m_behaviour->Update(this);

  Assert(dynamic_cast<SceneNodeCamera*>(GetSceneNode()));
  SceneNodeCamera* c = ((SceneNodeCamera*)GetSceneNode());
  c->SetEyePos(m_pos);
  c->SetLookAtPos(m_lookAt);
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
