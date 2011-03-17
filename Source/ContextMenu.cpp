#include "ContextMenu.h"
#include "CursorManager.h"
#include "EventPoller.h"

namespace Amju
{
ContextMenu::ContextMenu()
{
  m_isVisible = false;
}

void ContextMenu::Draw()
{
  //if (m_isVisible)
  {
    GuiMenu::Draw();
  }
}

void ContextMenu::OnButtonEvent(const ButtonEvent& be)
{
}

void ContextMenu::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  // Do regular processing but reposition on R button
  GuiMenu::OnMouseButtonEvent(mbe);

  if (mbe.button == AMJU_BUTTON_MOUSE_RIGHT &&
      mbe.isDown)
  {
    Cursor* c = TheCursorManager::Instance()->GetCursor(0);
    SetPos(c->GetPos());
    SetVisible(true);
  }
}
}
