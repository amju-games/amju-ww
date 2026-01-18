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

  m_pSceneNode = new FloorMesh(this);
  m_pSceneNode->SetMesh(mesh);
  m_pSceneNode->SetTexture(pTex);

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  Matrix yRot;
  yRot.SetIdentity(); // TODO need this ?
  yRot.RotateY(DegToRad(m_yRot));
  m_matrix = yRot;

  m_matrix.TranslateKeepRotation(m_pos);

  m_collMesh.CalcAABB(m_pSceneNode->GetAABB());
  m_pSceneNode->SetLocalTransform(m_matrix);

  return true;
}
}
