#include "Block.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "CollisionMesh.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "Floor.h"

namespace Amju
{
const char* Block::NAME = "block";

GameObject* CreateBlock() { return new Block; }
static bool reg = TheGameObjectFactory::Instance()->Add(Block::NAME, &CreateBlock);

Block::Block()
{
}

const char* Block::GetTypeName() const
{
  return NAME;
}

void Block::Draw()
{
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();

  // Blocks must lean in same dir as Floor
  if (m_floor)
  {
    m_matrix = *(m_floor->GetMatrix());
  }
  // TODO else block gets rotational velocity so it tumbles..?

  m_matrix.TranslateKeepRotation(m_pos);
  AmjuGL::MultMatrix(m_matrix);
  
  m_mesh->Draw();
  AmjuGL::PopMatrix();

  m_aabb.Draw();

  // TODO Shadow
}

void Block::Update()
{
  GameObject::Update();
  UpdatePhysics();
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
    f->ReportError("Expected exit position");
    return false;
  }

  m_mesh = LoadMeshResource(f);
  if (!m_mesh)
  {
    f->ReportError("Failed to load exit mesh");
    return false;
  }
  // Calc bounding box from mesh
  CollisionMesh cm;
  m_mesh->CalcCollisionMesh(&cm);
  cm.CalcAABB(&m_aabb);
  m_aabb.Translate(m_pos);  // ?

  m_shadow.Load();

  return true;
}
}
