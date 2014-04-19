#include <AmjuGL.h>
#include "SelectedNode.h"

namespace Amju
{
SelectedNode::SelectedNode() : m_isSelected(false)
{
}

void SelectedNode::BeforeDraw() 
{
  if (m_isSelected)
  {
    SetColour(Colour(1, 0, 0, 1));
  }
  else
  {
    SetColour(Colour(1, 1, 1, 1));
  }
}

void SelectedNode::AfterDraw() 
{
}

void SelectedNode::SetSel(bool sel)
{
  m_isSelected = sel;
}

}
