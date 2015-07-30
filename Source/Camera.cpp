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
#include "Player.h"
#include "EditModeCamera.h"
#include "Depth.h"

#ifdef _DEBUG
// Currently with this we can't have normal camera after edit mode
//#define EDIT_CAM
#endif

namespace Amju
{
GameObject* CreateCamera() { return new WWCamera; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(WWCamera::NAME, &CreateCamera);
#endif

const char* WWCamera::NAME = "camera";

static WWCamera* s_activeCamera = 0;
WWCamera* GetActiveCamera()
{
  return s_activeCamera;
}

Viewport* GetViewport(int i)
{
  return TheViewportManager::Instance()->GetViewport(i);
}

void CamZoomInOnPlayer::Update(WWCamera* cam)
{
  Assert(cam);
  Assert(cam->GetTarget());
  Vec3f v = cam->GetTarget()->GetPos();
  v.y += 50.0f; // TODO TEMP TEST - zoom in on player, not her feet
  Vec3f pos = cam->GetPos();
  
  // Get closer to player
  Vec3f vel = v - pos;
  static const float CAM_ZOOM_VEL_SCALE = ROConfig()->GetFloat("cam-zoom-vel-scale");
  vel *= CAM_ZOOM_VEL_SCALE;
  cam->SetVel(vel);
  cam->SetLookAtPos(v); 
}

void CamFollowPlayer::Update(WWCamera* cam)
{
  static const float Y_OFFSET = ROConfig()->GetFloat("cam-y-offset"); 
  static const float Z_OFFSET = ROConfig()->GetFloat("cam-z-offset"); 
  static const float Y_PET_OFFSET = ROConfig()->GetFloat("cam-y-pet-offset"); 
  static const float Z_PET_OFFSET = ROConfig()->GetFloat("cam-z-pet-offset"); 

  Assert(cam);
  Assert(cam->GetTarget());

  const Vec3f& v = cam->GetTarget()->GetPos();
  Vec3f pos = cam->GetPos();
  Vec3f vel = cam->GetVel();
  Vec3f acc = cam->GetAcc();

  // x-axis
  pos.x = v.x; 

  Player* player = dynamic_cast<Player*>(cam->GetTarget());
  Assert(player); // can point to other things??
  int numPets = player->GetPets().size();

  static const float PET_DIST_SPEED = 2.0f; // TODO CONFIG
  float dt = TheTimer::Instance()->GetDt();
  
  if (numPets > m_petDist)
  {
    m_petDist += dt * PET_DIST_SPEED;
    if (m_petDist > numPets)
    {
      m_petDist = (float)numPets;
    }
  }
  else if (numPets < m_petDist)
  {
    m_petDist -= dt * PET_DIST_SPEED;
    if (m_petDist < numPets)
    {
      m_petDist = (float)numPets;
    }
  }

  // Move in Y - but don't move in y if player is falling??
  //if (!player->IsFalling())
  
  // New game design: camera always moves down
  ////float scrollSpeed = 50.0f; // TODO speed up ?
  static const float depthOffset = ROConfig()->GetFloat("cam-depth-offset");
  pos.y = depthOffset - GetCurrentDepth();     
    //-= dt * scrollSpeed; // = v.y + Y_OFFSET + m_petDist * Y_PET_OFFSET;
  
  // Z is fixed distance from player
  pos.z = v.z + Z_OFFSET; // + m_petDist * Z_PET_OFFSET;

  // Dampen camera movement so smoother??
  //Vec3f oldPos = cam->GetPos();
  //pos = (pos + oldPos) * 0.5f;
  
  cam->SetPos(pos);
  cam->SetVel(vel);
  cam->SetAcc(acc);
  cam->SetLookAtPos(Vec3f(pos.x, pos.y - Y_OFFSET, v.z));
}

WWCamera::WWCamera()
{
  m_targetId = -1;
  m_target = 0;
  m_earthquakeSeverity = 0;

  m_behaviour = new CamFollowPlayer;
  //m_behaviour = new CamZoomInOnPlayer;
}

void WWCamera::AddPropertiesGui(PropertiesDialog* dlg) 
{
  // TODO
//  dlg->AddItem(new PropertiesDialog::IntItem("Target ID", m_targetId));
//  dlg->AddItem(new PropertiesDialog::IntItem("Viewport ID", m_viewportId));
}

PropertyValue WWCamera::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }
  return WWGameObject::GetProp(key);
}

void WWCamera::SetProp(PropertyKey key, PropertyValue value)
{
  WWGameObject::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

WWGameObject* WWCamera::Clone() 
{
  return new WWCamera(*this);
}

const char* WWCamera::GetTypeName() const
{
  return NAME;
}

void WWCamera::AddToGame()
{
  TheGame::Instance()->AddGameObject(this);
}

void WWCamera::RemoveFromGame()
{
  TheGame::Instance()->EraseGameObject(GetId());
}

void WWCamera::Reset()
{
  static const float Y_OFFSET = ROConfig()->GetFloat("cam-y-offset"); 
  static const float Z_OFFSET = ROConfig()->GetFloat("cam-z-offset"); 

  if (!m_target)
  {
#ifdef CAM_DEBUG
std::cout << "WWCamera obj ID: " << GetId() << " target ID: " << m_targetId << "\n";
#endif

    m_target = TheGame::Instance()->GetGameObject(m_targetId);
    Assert(m_target);
  }

  const Vec3f& v = m_target->GetPos();
  m_pos = Vec3f(v.x, v.y + Y_OFFSET, v.z + Z_OFFSET);
}

void WWCamera::SetEarthquake(float severity)
{
  m_earthquakeSeverity = severity;
}

void WWCamera::Update()
{
  if (!GetSceneNode())
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

bool WWCamera::Save(File* f)
{
  f->WriteComment("// ID");
  f->WriteInteger(GetId());
  f->WriteComment("// Viewport ID");
  f->WriteInteger(m_viewportId);
  f->WriteComment("// Target ID");
  f->WriteInteger(m_targetId);
  
  return true;
}

bool WWCamera::Load(File* f)
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
  SetSceneNode(new SceneNodeCamera);
  vp->SetCamera(this);

  return true;
}

void WWCamera::SetAsSceneGraphCamera()
{
  SceneGraph* graph = GetGameSceneGraph();

#ifdef EDIT_CAM
  // Check for edit mode camera
  if (dynamic_cast<EditModeWWCamera*>(graph->GetCamera().GetPtr()))
  {
//    return;
  }
#endif

  Assert(dynamic_cast<SceneNodeCamera*>(GetSceneNode()));
  graph->SetCamera((SceneNodeCamera*)GetSceneNode());
  s_activeCamera = this;
}
}
