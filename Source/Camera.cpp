#include <ROConfig.h>
#include <AmjuRand.h>
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

Viewport* GetViewport(int i)
{
  return TheViewportManager::Instance()->GetViewport(i);
}

void CamZoomInOnPlayer::Update(Camera* cam)
{
  Assert(cam);
  Assert(cam->GetTarget());
  Vec3f v = cam->GetTarget()->GetPos();
  v.y += 50.0f; // TODO TEMP TEST - zoom in on player, not her feet
  Vec3f pos = cam->GetPos();
  
  // Get closer to player
  Vec3f vel = v - pos;

  cam->SetVel(vel);
  cam->SetLookAtPos(v); 
}

void CamFollowPlayer::Update(Camera* cam)
{
  static const float Y_OFFSET = ROConfig()->GetFloat("cam-y-offset"); 
  static const float Z_OFFSET = ROConfig()->GetFloat("cam-z-offset"); 

  Assert(cam);
  Assert(cam->GetTarget());

  const Vec3f& v = cam->GetTarget()->GetPos();
  Vec3f pos = cam->GetPos();
  Vec3f vel = cam->GetVel();
  Vec3f acc = cam->GetAcc();

  static const float CAM_SPEED = ROConfig()->GetFloat("cam-speed"); 
  static const float CAM_ACC = CAM_SPEED * 2.5f;
  // TODO Move in x if too far left/right
  static const float TOO_FAR = ROConfig()->GetFloat("cam-too-far"); 

/*
  // Don't change dir if camera already moving
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
  static const float STOP = ROConfig()->GetFloat("cam-stop"); 
  if (fabs(vel.x) < STOP)
  {
    vel.x = 0;
    acc.x = 0;
  }
*/
  // x-axis
  pos.x = v.x; 

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
  m_earthquakeSeverity = 0;

  m_behaviour = new CamFollowPlayer;
  //m_behaviour = new CamZoomInOnPlayer;
}

WWGameObject* Camera::Clone() 
{
  return new Camera(*this);
}

const char* Camera::GetTypeName() const
{
  return NAME;
}

void Camera::AddToGame()
{
  TheGame::Instance()->AddGameObject(this);
}

void Camera::RemoveFromGame()
{
  TheGame::Instance()->EraseGameObject(GetId());
}

void Camera::Reset()
{
  static const float Y_OFFSET = ROConfig()->GetFloat("cam-y-offset"); 
  static const float Z_OFFSET = ROConfig()->GetFloat("cam-z-offset"); 

  if (!m_target)
  {
std::cout << "Camera obj ID: " << GetId() << " target ID: " << m_targetId << "\n";

    m_target = TheGame::Instance()->GetGameObject(m_targetId);
    Assert(m_target);
  }

  const Vec3f& v = m_target->GetPos();
  m_pos = Vec3f(v.x, v.y + Y_OFFSET, v.z + Z_OFFSET);
}

void Camera::SetEarthquake(float severity)
{
  m_earthquakeSeverity = severity;
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
  Vec3f look = m_lookAt;
  if (m_earthquakeSeverity > 0)
  {
    float e = m_earthquakeSeverity * 1.0f; // TODO
    float dt = TheTimer::Instance()->GetDt();
    m_earthquakeSeverity -= dt;
    if (m_earthquakeSeverity < 0)
    {
      m_earthquakeSeverity = 0;
    } 
    look += Vec3f(Rnd(-e, e), 0, Rnd(-e, e));
  }
  c->SetLookAtPos(look);
  c->SetUpVec(Vec3f(0, 1, 0)); 
}

bool Camera::Save(File* f)
{
  f->WriteComment("// ID");
  f->WriteInteger(GetId());
  f->WriteComment("// Viewport ID");
  f->WriteInteger(m_viewportId);
  f->WriteComment("// Target ID");
  f->WriteInteger(m_targetId);
  
  return true;
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
