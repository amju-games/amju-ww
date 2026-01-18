#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"
#include "EventPoller.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"

namespace Amju
{
GameObject* CreateSkybox() { return new Skybox; }
static bool reg = TheGameObjectFactory::Instance()->Add(Skybox::NAME, &CreateSkybox);

const char* Skybox::NAME = "skybox";

Skybox::Skybox()
{
}

WWGameObject* Skybox::Clone()
{
  return new Skybox(*this);
}

void Skybox::AddPropertiesGui(PropertiesDialog* dlg)
{
  std::string colStr = ToHexString(m_colour);
  dlg->AddItem(new PropertiesDialog::TextItem("Colour", colStr, PROP_COLOUR));
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

/*
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
*/

void Skybox::Update()
{
}
}
