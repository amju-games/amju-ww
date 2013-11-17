#include <AmjuGL.h>
#include <File.h>
#include <LoadAABB.h>
#include <SceneNode.h>
#include <DrawAABB.h>
#include "Trigger.h"
#include "MySceneGraph.h"

namespace Amju
{
class TriggerNode : public SceneNode
{
public:
  TriggerNode()
  {
    SetBlended(true);
    SetIsLit(true);
  }

  virtual void Draw() override
  {
#ifdef AMJU_IOS
    // Can't draw Tri Lists directly in ES - TODO change DrawSolidAABB etc
#else
    AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
    AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
    PushColour();
    MultColour(Colour(0, 0, 1, 0.5f));
    DrawSolidAABB(m_aabb);
    PopColour();
    AmjuGL::PopAttrib();
#endif
  }
};

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

  // TODO If edit mode
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
