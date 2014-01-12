#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"
#include "EventPoller.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "PropertiesDialog.h"

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

WWGameObject* Skybox::Clone()
{
  return new Skybox(*this);
}

void Skybox::AddPropertiesGui(PropertiesDialog* dlg)
{
  // TODO
}

PropertyValue Skybox::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }
  return WWGameObject::GetProp(key);
}

void Skybox::SetProp(PropertyKey key, PropertyValue value)
{
  WWGameObject::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

const char* Skybox::GetTypeName() const
{
  return NAME;
}

bool Skybox::Save(File* f)
{
  // TODO
  return false;
}

bool Skybox::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }

  if (!LoadMeshResource(f))
  {
    return false;
  }

  return true;
}

void Skybox::AddToGame()
{
  // Different - no shadows. In future may be comprised of multiple cloud
  //  billboards.
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_SKYBOX, GetSceneNode());
}

bool Skybox::CreateSceneNode()
{
  // TODO Why is mesh stored as m_mesh in skybox? May not be needed.
  m_mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(m_meshFilename);
  if (!m_mesh)
  {
    return false;
  }
  Assert(m_mesh);

  SceneMesh* sm = new SceneMesh;
  sm->SetMesh(m_mesh);
  SetSceneNode(sm);

  return true;
}

void Skybox::Update()
{
//  static const float ROT_VEL = 2.0f; // degs/dec
//  m_yRot += ROT_VEL * TheTimer::Instance()->GetDt();

  Matrix mat;
  mat.RotateX(m_xRot);
  Matrix mat2;
  mat.RotateY(m_yRot);
  GetSceneNode()->SetLocalTransform(mat);
  GetSceneNode()->MultLocalTransform(mat2);
}
}
