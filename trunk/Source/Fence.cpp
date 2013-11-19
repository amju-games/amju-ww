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

bool Fence::Save(File* f)
{
  f->WriteInteger(GetId());
  SaveVec3(f, m_pos);
  f->WriteFloat(m_yRot);
  return SaveMeshResource(f);
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
  m_startPos = m_pos;

  // Load rotation around y axis 
  if (!f->GetFloat(&m_yRot))
  { 
    f->ReportError("Expected fence orientation");
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
  m_pSceneNode = sm;
  sm->SetMesh(mesh);

  // Calc bounding box from mesh
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);

  Matrix m;
  m.RotateY(DegToRad(m_yRot));
  m.TranslateKeepRotation(m_pos);
  cm.Transform(m);

  cm.CalcAABB(&m_aabb);
  sm->SetAABB(m_aabb);
  sm->SetLocalTransform(m);

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);
 
  return true;
}

void Fence::Update()
{
}

void Fence::Reset()
{
  WWGameObject::Reset();
}

}
