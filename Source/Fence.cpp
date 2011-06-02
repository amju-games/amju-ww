#include "Fence.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "CollisionMesh.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "ObjMesh.h"
#include "DegRad.h"

namespace Amju
{
const char* Fence::NAME = "fence";

GameObject* CreateFence() { return new Fence; }
static bool reg = TheGameObjectFactory::Instance()->Add(Fence::NAME, &CreateFence);

Fence::Fence()
{
  m_yRot = 0;
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
  // Load rotation around y axis
  if (!f->GetFloat(&m_yRot))
  {
    f->ReportError("Expected fence y rot");
    return false;
  }

  m_pos = m_pos * m_mat;

  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load fence mesh");
    return false;
  }

  SceneMesh* sm = new SceneMesh;
  sm->SetMesh(mesh);
  m_pSceneNode = sm;

  // Calc bounding box from mesh
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);

  Matrix m;
  m.RotateY(DegToRad(m_yRot));
  m.TranslateKeepRotation(m_pos);
  cm.Transform(m);

  cm.CalcAABB(m_pSceneNode->GetAABB());

  m_pSceneNode->SetLocalTransform(m);

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);
 
  return true;
}

void Fence::Update()
{

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
