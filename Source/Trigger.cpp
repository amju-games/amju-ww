#include <AmjuGL.h>
#include <File.h>
#include <LoadAABB.h>
#include <SceneNode.h>
#include <DrawAABB.h>
#include "Trigger.h"
#include "TriggerNode.h"
#include "MySceneGraph.h"
#include "GameMode.h"

namespace Amju
{
// Default box size
static const float SIZE = 50.0f;

Trigger::Trigger()
{
  m_aabbExtents = Vec3f(SIZE, SIZE, SIZE);
  m_extentsSet = true;
}

bool Trigger::Save(File* f)
{
  if (!f->WriteInteger(GetId()))
  {
    return false;
  }
  if (!SaveAABB(f, m_aabb))
  {
    f->ReportError("Failed to save trigger AABB");
    return false;
  }
  return true;
}

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

bool Trigger::CreateSceneNode()
{
  if (IsEditMode())
  {
    TriggerNode* tn = new TriggerNode;
    tn->SetAABB(m_aabb);
    SetSceneNode(tn);
  }
  return true;
}
}
