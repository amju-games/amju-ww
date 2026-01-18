#include "WWGameObject.h"

namespace Amju
{
WWGameObject::WWGameObject()
{
  m_isDead = false;
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
