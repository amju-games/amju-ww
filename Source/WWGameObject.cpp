#include "WWGameObject.h"

namespace Amju
{
WWGameObject::WWGameObject()
{
  m_isDead = false;
  m_pSceneNode = 0;
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
}
