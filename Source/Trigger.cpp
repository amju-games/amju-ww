#include "Trigger.h"
#include <File.h>
#include <LoadAABB.h>

namespace Amju
{
bool Trigger::Load(File* f)
{
  if (!WWGameObject::Load(f))
  {
    return false;
  }
  if (!LoadAABB(f, &m_aabb))
  {
    f->ReportError("Failed to load trigger AABB");
    return false;
  }
  return true;
}

AABB* Trigger::GetAABB()
{
  return &m_aabb;
}
}
