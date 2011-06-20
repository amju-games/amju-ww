#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"
#include "EventPoller.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"

//#define MOUSE_MOVE_SKYBOX

namespace Amju
{
GameObject* CreateSkybox() { return new Skybox; }
static bool reg = TheGameObjectFactory::Instance()->Add(Skybox::NAME, &CreateSkybox);

const char* Skybox::NAME = "skybox";

Skybox::Skybox()
{
  m_xRot = 0;
  m_yRot = 0;

#ifdef MOUSE_MOVE_SKYBOX
  TheEventPoller::Instance()->AddListener(this);
#endif
}

const char* Skybox::GetTypeName() const
{
  return NAME;
}

bool Skybox::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }

  m_mesh = LoadMeshResource(f);
  Assert(m_mesh);

  SceneMesh* sm = new SceneMesh;
  sm->SetMesh(m_mesh);
  m_pSceneNode = sm;
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_SKYBOX, m_pSceneNode);

  return true;
}

bool Skybox::OnCursorEvent(const CursorEvent& ce)
{
  static float oldx = ce.x;
  static float oldy = ce.y;
  float xdiff = ce.x - oldx;
  float ydiff = ce.y - oldy;
  oldx = ce.x;
  oldy = ce.y;

  m_yRot += xdiff;
  m_xRot += ydiff;
  return false;
}

/*
void Skybox::Draw()
{
  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();

  AmjuGL::RotateX(m_xRot);
  AmjuGL::RotateY(m_yRot);
  m_mesh->Draw();

  AmjuGL::PopMatrix();
}
*/

void Skybox::Update()
{
//  static const float ROT_VEL = 2.0f; // degs/dec
//  m_yRot += ROT_VEL * TheTimer::Instance()->GetDt();

  Matrix mat;
  mat.RotateX(m_xRot);
  Matrix mat2;
  mat.RotateY(m_yRot);
  m_pSceneNode->SetLocalTransform(mat);
  m_pSceneNode->MultLocalTransform(mat2);
}
}
