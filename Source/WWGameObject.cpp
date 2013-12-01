#include <File.h>
#include <Game.h>
#include <DegRad.h>
#include "WWGameObject.h"
#include "MySceneGraph.h"
#include "ShadowManager.h"
#include "Describe.h"

namespace Amju
{
WWGameObject::WWGameObject()
{
  m_isDead = false;
  m_pSceneNode = 0;
  m_extentsSet = false;
  m_shadowSize = 0;
}
  
void WWGameObject::AddToGame()
{
  if (!m_shadowTexName.empty())
  {
    TheShadowManager::Instance()->AddCaster(this, m_shadowSize, m_shadowTexName);
  }
  TheGame::Instance()->AddGameObject(this);

  CreateSceneNode(); 

  SceneNode* sn = GetSceneNode();
  if (sn)
  {
    SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
    Assert(root);
    root->AddChild(sn);
  }
}

void WWGameObject::RemoveFromGame()
{
  if (!m_shadowTexName.empty())
  {
    TheShadowManager::Instance()->RemoveCaster(this);
  }

  TheGame::Instance()->EraseGameObject(GetId());

  SceneNode* sn = GetSceneNode();
  if (sn)
  {
    SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
    Assert(root);
    root->DelChild(sn);
  }
}

void WWGameObject::Reset() 
{
  SetDead(false);
  SetPos(m_startPos);
  SetVel(Vec3f());
  RecalcAABB();
  SceneNode* sn = GetSceneNode();
  if (sn)
  {
    Matrix mat;
    mat.Translate(m_startPos);
    sn->SetLocalTransform(mat);
  }
}

void WWGameObject::Move(const Vec3f& move)
{
  Vec3f p = GetPos();
  p += move;
  m_startPos = p;
  SetPos(p);

  m_aabb.Translate(move);

  SceneNode* sn = GetSceneNode();
  Assert(sn);
  sn->SetAABB(m_aabb);
  Matrix mat;
  mat.Translate(move);
  sn->MultLocalTransform(mat);
}

void WWGameObject::RotateY(float angleDegs)
{
  float rads = DegToRad(angleDegs);
  Matrix mat;
  mat.RotateY(rads);
  m_aabb.Transform(mat);
  SceneNode* sn = GetSceneNode();
  Assert(sn);
  sn->MultLocalTransform(mat);
  sn->SetAABB(m_aabb);
}

bool WWGameObject::CreateSceneNode()
{
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(m_meshFilename);
  if (!mesh) 
  {
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  m_pSceneNode = sm;

  // Set bounding box
  RecalcAABB();

  return true;
}

bool WWGameObject::LoadMeshResource(File* f)
{
  if (!f->GetDataLine(&m_meshFilename))
  {
    f->ReportError("Expected mesh file name");
    return false;
  }
  
  // TODO verify file exists?

  return true;
}

bool WWGameObject::SaveMeshResource(File* f)
{
  if (m_meshFilename.empty()) 
  {
    f->ReportError("No mesh filename for " + Describe(this));
    return false;
  }
  f->WriteComment("// Mesh filename");
  return f->Write(m_meshFilename);
}

bool WWGameObject::SaveShadow(File* f)
{
  if (m_shadowTexName.empty()) 
  {
    f->ReportError("No shadow texture name for " + Describe(this));
    return false;
  }
  f->WriteComment("// Shadow texture & size");
  return f->Write(m_shadowTexName) && f->WriteFloat(m_shadowSize);
}

bool WWGameObject::LoadShadow(File* f)
{
  if (!f->GetDataLine(&m_shadowTexName))
  {
    f->ReportError("Expected shadow texture resource name");
    return false;
  }

  if (!f->GetFloat(&m_shadowSize))
  {
    f->ReportError("Expected shadow size");
    return false;
  }

  return true;
}

SceneNode* WWGameObject::GetSceneNode()
{
  return m_pSceneNode;
}

void WWGameObject::SetTransform(const Matrix& mat)
{
  m_mat = mat;
}

void WWGameObject::SetDead(bool dead)
{
  m_isDead = dead;
}

bool WWGameObject::IsDead() const
{
  return m_isDead;
}

void WWGameObject::RecalcAABB()
{
  if (m_extentsSet)
  {
    m_aabb = AABB(
      m_pos.x - m_aabbExtents.x, m_pos.x + m_aabbExtents.x,
      m_pos.y - m_aabbExtents.y, m_pos.y + m_aabbExtents.y,
      m_pos.z - m_aabbExtents.z, m_pos.z + m_aabbExtents.z);
  }

  if (m_pSceneNode)
  {
    m_pSceneNode->SetAABB(m_aabb);
  }
}

}
