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
  // Load rotation around y axis - "ew" for east-west orientation, or "ns" for north-south
  std::string orientation;
  if (!f->GetDataLine(&orientation))
  { 
    f->ReportError("Expected fence orientation");
    return false;
  }

  bool ns = false;
  if (orientation == "ns")
  {
    ns = true;
    m_yRot = 0;
  }
  else if (orientation == "ew")
  {
    m_yRot = 90.0f;
  }
  else 
  {
    f->ReportError("Bad fence orientation, expected \"ns\" or \"ew\"");
    return false;
  }

  // Get number of fence units
  int numUnits = 0;
  if (!f->GetInteger(&numUnits))
  {
    f->ReportError("Expected number of fence units");
    return false;
  }
  m_pos = m_pos * m_mat;
  Vec3f pos = m_pos;

  m_pSceneNode = new SceneNode; // parent for all fence units

  std::string meshName; // pz-fence.obj"; // TODO should we specify every time ?
  if (!f->GetDataLine(&meshName))
  {
    f->ReportError("Expected fence mesh name");
    return false;
  }

  for (int i = 0; i < numUnits; i++)
  {
    ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(meshName);

    if (!mesh)
    {
      f->ReportError("Failed to load fence mesh");
      return false;
    }

    SceneMesh* sm = new SceneMesh;
    sm->SetMesh(mesh);
    m_pSceneNode->AddChild(sm);

    // Calc bounding box from mesh
    CollisionMesh cm;
    mesh->CalcCollisionMesh(&cm);

    Matrix m;
    m.RotateY(DegToRad(m_yRot));
    m.TranslateKeepRotation(pos);
    cm.Transform(m);

    AABB aabb;
    cm.CalcAABB(&aabb);
    // Expand total AABB to include this one
    if (i == 0)
    {  
      m_aabb = aabb;
    }
    else
    {
      m_aabb.Union(aabb);
    }
    sm->SetAABB(aabb);

    if (ns)
    {
      pos += Vec3f(0, 0, sm->GetAABB()->GetZSize());
    }
    else
    {
      pos += Vec3f(sm->GetAABB()->GetXSize(), 0, 0);
    }

    sm->SetLocalTransform(m);
  }

  // Parent BV is union of all children BVs
  m_pSceneNode->UpdateBoundingVol();

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

}
