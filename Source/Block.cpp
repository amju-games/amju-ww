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

const char* Block::GetTypeName() const
{
  return NAME;
}

//AABB* Block::GetAABB()
//{
//  Assert(m_pSceneNode);
//  return m_pSceneNode->GetAABB();
//}

/*
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
*/

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

  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load block mesh");
    return false;
  }

  // Separate SceneNode
//  m_shadow.Load();

  // We can just use a Mesh scene node type, right ?
  SceneMesh* sm = new SceneMesh;
  sm->SetMesh(mesh);
  m_pSceneNode = sm;

  // Calc bounding box from mesh
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);
//  cm.CalcAABB(m_pSceneNode->GetAABB());
//  m_pSceneNode->GetAABB()->Translate(m_pos);  // ?

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);
 
  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
