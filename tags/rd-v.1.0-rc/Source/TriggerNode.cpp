#include <AmjuGL.h>
#include <DrawAABB.h>
#include "TriggerNode.h"

namespace Amju
{
TriggerNode::TriggerNode()
{
  SetBlended(true);
  SetIsLit(true);
}

void TriggerNode::Draw() 
{
#ifdef AMJU_IOS
  // Can't draw Tri Lists directly in ES - TODO change DrawSolidAABB etc
#else
  AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
  AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
//  PushColour();
//  MultColour(Colour(1, 1, 1, 0.9f));
  DrawSolidAABB(m_aabb);
//  PopColour();
  AmjuGL::PopAttrib();
#endif
}
}
