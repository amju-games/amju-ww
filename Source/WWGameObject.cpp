#include <File.h>
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

ObjMesh* WWGameObject::LoadMeshResource(File* f)
{
  if (!f->GetDataLine(&m_meshFilename))
  {
    f->ReportError("Expected mesh file name");
    return 0;
  }
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(m_meshFilename);
  Assert(mesh);
  return mesh;
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
  Assert(m_pSceneNode);

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

  TheShadowManager::Instance()->AddCaster(this, m_shadowSize, m_shadowTexName);

  return true;
}

SceneNode* WWGameObject::GetSceneNode()
{
  return m_pSceneNode;
}

void WWGameObject::AddSceneNode()
{
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(m_pSceneNode);
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
