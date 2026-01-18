#include "Fence.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "CollisionMesh.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
//#include "Floor.h"
#include "ObjMesh.h"

namespace Amju
{
const char* Fence::NAME = "fence";

GameObject* CreateFence() { return new Fence; }
static bool reg = TheGameObjectFactory::Instance()->Add(Fence::NAME, &CreateFence);

Fence::Fence()
{
}

const char* Fence::GetTypeName() const
{
  return NAME;
}

bool Fence::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }

  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected fence position");
    return false;
  }
  // TODO y rot
  m_pos = m_pos * m_mat;

  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load fence mesh");
    return false;
  }

  m_pSceneNode = new SceneMesh;
  ((SceneMesh*)m_pSceneNode)->SetMesh(mesh);

  // Calc bounding box from mesh
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);
  cm.CalcAABB(m_pSceneNode->GetAABB());
  m_pSceneNode->GetAABB()->Translate(m_pos);  

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);
 
  //if (!LoadShadow(f))
  //{
  //  return false;
  //}

  return true;
}

void Fence::Update()
{
  Matrix mat;
  //? TODO mat.RotateY(m_yRot);
  mat.TranslateKeepRotation(m_pos);
  m_pSceneNode->SetLocalTransform(mat);
}

void Fence::Reset()
{
  // If fences were moveable, move back to start pos here...
}

AABB* Fence::GetAABB()
{
  Assert(m_pSceneNode);
  return m_pSceneNode->GetAABB();
}
}
