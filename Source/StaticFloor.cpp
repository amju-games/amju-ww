#include "StaticFloor.h"
#include "LoadVec3.h"
#include "LoadMeshResource.h"
#include "LoadTextureResource.h"
#include "MySceneGraph.h"
#include <GameObjectFactory.h>
#include <File.h>
#include <DegRad.h>

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
  if (!GameObject::Load(f))
  {
    return false;
  }

  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected floor position");
    return false;
  }
  m_pos = m_pos * m_mat;

  // Load rotation around y axis
  if (!f->GetFloat(&m_yRot))
  {
    f->ReportError("Expected floor y rot");
    return false;
  }

  // Load mesh 
  ObjMesh* mesh = LoadMeshResource(f);

  mesh->CalcCollisionMesh(&m_collMesh);
  Matrix m;
  m.RotateY(DegToRad(m_yRot));
  m.TranslateKeepRotation(m_pos);
  m_collMesh.Transform(m);

  // Load texture
  Texture* pTex = LoadTextureResource(f); 

  FloorMesh* fm = new FloorMesh(this);
  fm->SetMesh(mesh);
  fm->SetTexture(pTex);
  m_pSceneNode = fm;
  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  Matrix yRot;
  yRot.SetIdentity(); // TODO need this ?
  yRot.RotateY(DegToRad(m_yRot));
  m_matrix = yRot;

  m_matrix.TranslateKeepRotation(m_pos);

  AABB aabb;
  m_collMesh.CalcAABB(&aabb);
  m_pSceneNode->SetAABB(aabb);

  m_pSceneNode->SetLocalTransform(m_matrix);

  return true;
}
}
