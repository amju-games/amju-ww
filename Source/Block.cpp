#include "Block.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "CollisionMesh.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "Floor.h"
#include "ObjMesh.h"

namespace Amju
{
const char* Block::NAME = "block";

GameObject* CreateBlock() { return new Block; }
static bool reg = TheGameObjectFactory::Instance()->Add(Block::NAME, &CreateBlock);

Block::Block()
{
}

WWGameObject* Block::Clone() 
{
  return new Block(*this);
}

const char* Block::GetTypeName() const
{
  return NAME;
}

void Block::Update()
{
  OnFloor::Update();

  Matrix mat;
  mat.Translate(m_pos);
  m_pSceneNode->SetLocalTransform(mat);

  // TODO As crates can rotate, recalc OBB and AABB ?
  // This kind of works but errors accumulate. Reset box coords each time.
//  Vec3f dPos = m_pos - GetOldPos();
//  m_pSceneNode->GetAABB()->Translate(dPos);  // ?
}
  
bool Block::Save(File* f)
{
  f->WriteInteger(GetId());
  if (!SaveVec3(f, m_pos))
  {
    f->ReportError("Failed to save block position");
    return false;
  }
  if (!SaveMeshResource(f))
  {
    f->ReportError("Failed to save block mesh");
    return false;
  }
  if (!SaveShadow(f))
  {
    f->ReportError("Failed to save block shadow");
    return false;
  }
  return true;
}

bool Block::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }

  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected block position");
    return false;
  }
  m_pos = m_pos * m_mat;

  if (!LoadMeshResource(f))
  {
    f->ReportError("Failed to load block mesh");
    return false;
  }

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
