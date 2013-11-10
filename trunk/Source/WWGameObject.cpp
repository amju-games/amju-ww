#include "WWGameObject.h"
#include "MySceneGraph.h"

namespace Amju
{
WWGameObject::WWGameObject()
{
  m_isDead = false;
  m_pSceneNode = 0;
  m_extentsSet = false;
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
