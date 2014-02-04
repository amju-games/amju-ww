#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"
#include "EventPoller.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"
#include "GSMain.h"

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
  dlg->AddItem(new PropertiesDialog::FilenameItem("Mesh", m_meshFilename, PROP_MESH));

  std::string colStr = ToHexString(m_colour);
  dlg->AddItem(new PropertiesDialog::TextItem("Colour", colStr, PROP_COLOUR));
}

PropertyValue Skybox::GetProp(PropertyKey key)
{
  switch (key)
  {
  case PROP_COLOUR:
    return ToHexString(m_colour);
  }
  return WWGameObject::GetProp(key);
}

void Skybox::SetProp(PropertyKey key, PropertyValue value)
{
  WWGameObject::SetProp(key, value);
  switch (key)
  {
  case PROP_COLOUR:
    m_colour = FromHexString(value.GetString());
  }
}

const char* Skybox::GetTypeName() const
{
  return NAME;
}

bool Skybox::Save(File* f)
{
  if (!f->WriteInteger(GetId()))
  {
    f->ReportError("Skybox: Failed to write ID");
    return false;
  }

  if (!SaveMeshResource(f))
  {
    return false;
  }

  std::string s = ToHexString(m_colour);
  if (!f->Write(s))
  {
    f->ReportError("Couldn't save colour string");
    return false;
  }
  return true;
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

  std::string s;
  if (!f->GetDataLine(&s))
  {
    f->ReportError("Expected skybox colour");
    return false;
  }
  m_colour = FromHexString(s);

  return true;
}

void Skybox::AddToGame()
{
  // Different - no shadows. In future may be comprised of multiple cloud
  //  billboards.
  //GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, GetSceneNode());

  WWGameObject::AddToGame();

  TheGSMain::Instance()->SetClearColour(m_colour);
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
