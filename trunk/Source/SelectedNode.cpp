#include <AmjuGL.h>
#include "SelectedNode.h"

namespace Amju
{
SelectedNode::SelectedNode() : m_isSelected(false)
{
}

void SelectedNode::BeforeDraw() 
{
  PushColour();
  MultColour(m_isSelected ? Colour(1, 0, 0, 1) : Colour(1, 1, 1, 1));
}

void SelectedNode::AfterDraw() 
{
  PopColour();
}

void SelectedNode::SetSel(bool sel)
{
  m_isSelected = sel;
}

}
