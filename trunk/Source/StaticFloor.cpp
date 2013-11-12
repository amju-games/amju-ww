#include <GameObjectFactory.h>
#include <File.h>
#include <DegRad.h>
#include "StaticFloor.h"
#include "LoadVec3.h"
#include "LoadMeshResource.h"
#include "LoadTextureResource.h"
#include "MySceneGraph.h"
#include "ShadowManager.h"

namespace Amju
{
GameObject* CreateStaticFloor() { return new StaticFloor; }

static bool reg = TheGameObjectFactory::Instance()->Add(
  StaticFloor::NAME, &CreateStaticFloor);

const char* StaticFloor::NAME = "staticfloor";

const char* StaticFloor::GetTypeName() const
{
  return NAME;
}

void StaticFloor::Update()
{
}

bool StaticFloor::Load(File* f)
{
  if (!LoadMesh(f))
  {
    return false;
  }

  Matrix yRot;
  yRot.SetIdentity(); // TODO need this ?
  yRot.RotateY(DegToRad(m_yRot));
  m_matrix = yRot;

  m_matrix.TranslateKeepRotation(m_pos);

  m_collMesh->CalcAABB(&m_aabb);
  m_pSceneNode->SetAABB(m_aabb);

  m_pSceneNode->SetLocalTransform(m_matrix);

  TheShadowManager::Instance()->AddFloor(this);

  return true;
}
}
