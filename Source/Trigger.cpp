#include "Trigger.h"
#include <File.h>
#include <LoadAABB.h>
#include <SceneNode.h>
#include "MySceneGraph.h"

namespace Amju
{
class TriggerNode : public SceneNode
{
};

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
#ifdef _DEBUG
  // Create a scene node for this trigger
  TriggerNode* tn = new TriggerNode;
  tn->SetAABB(m_aabb);
  m_pSceneNode = tn;
  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

#endif

  return true;
}

}
