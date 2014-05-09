#include <GameObjectFactory.h>
#include <File.h>
#include <DegRad.h>
#include "StaticFloor.h"
#include "LoadVec3.h"
#include "LoadMeshResource.h"
#include "LoadTextureResource.h"
#include "MySceneGraph.h"
#include "ShadowManager.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"

namespace Amju
{
GameObject* CreateStaticFloor() { return new StaticFloor; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(StaticFloor::NAME, &CreateStaticFloor);
#endif

const char* StaticFloor::NAME = "staticfloor";

WWGameObject* StaticFloor::Clone()
{
  return new StaticFloor(*this);
}

void StaticFloor::AddPropertiesGui(PropertiesDialog* dlg)
{
  dlg->AddItem(new PropertiesDialog::FilenameItem("Mesh", m_meshFilename, PROP_MESH));
}

const char* StaticFloor::GetTypeName() const
{
  return NAME;
}

void StaticFloor::Update()
{
  CheckIfDead(); // to delete when off screen
}

bool StaticFloor::Save(File* f)
{
  return SaveMesh(f);
}

bool StaticFloor::Load(File* f)
{
  if (!LoadMesh(f))
  {
    return false;
  }

  return true;
}

/*
void StaticFloor::AddToGame()
{
  Matrix yRot;
  yRot.SetIdentity(); // TODO need this ?
  yRot.RotateY(DegToRad(m_yRot));
  m_matrix = yRot;

  m_matrix.TranslateKeepRotation(m_pos);

  m_collMesh->CalcAABB(&m_aabb);
  m_pSceneNode->SetAABB(m_aabb);

  m_pSceneNode->SetLocalTransform(m_matrix);

  TheShadowManager::Instance()->AddFloor(this);
}
*/

}
