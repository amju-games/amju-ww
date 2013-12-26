#include <GameObjectFactory.h>
#include <LoadVec3.h>
#include <CollisionMesh.h>
#include <File.h>
//#include "LoadMeshResource.h"
#include <SceneMesh.h>
#include <ObjMesh.h>
#include <DegRad.h>
#include "Fence.h"
#include "MySceneGraph.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"

namespace Amju
{
const char* Fence::NAME = "fence";

GameObject* CreateFence() { return new Fence; }
static bool reg = TheGameObjectFactory::Instance()->Add(Fence::NAME, &CreateFence);

Fence::Fence()
{
  m_yRot = 0;
}

void Fence::AddPropertiesGui(PropertiesDialog* dlg)
{
  dlg->AddItem(new PropertiesDialog::FilenameItem("Mesh", m_meshFilename, PROP_MESH));
}

WWGameObject* Fence::Clone() 
{
  return new Fence(*this);
}

const char* Fence::GetTypeName() const
{
  return NAME;
}

void Fence::RotateY(float angleDegs)
{
  m_yRot += angleDegs;
  WWGameObject::RotateY(angleDegs);
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
//  m_pos = m_pos * m_mat;

  if (!LoadMeshResource(f))
  {
    f->ReportError("Failed to load fence mesh");
    return false;
  }

  return true;
}

bool Fence::CreateSceneNode()
{
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(m_meshFilename);
  if (!mesh)
  {
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  m_pSceneNode = sm;

  // Calc bounding box from mesh
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);

  Matrix m;
  m.RotateY(DegToRad(m_yRot));
  Matrix m2;
  m2.Translate(m_pos);
  m = m * m2; // TODO check
  cm.Transform(m);

  cm.CalcAABB(&m_aabb);
  m_pSceneNode->SetAABB(m_aabb);
  m_pSceneNode->SetLocalTransform(m);

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
