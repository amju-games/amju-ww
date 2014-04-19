#include "ContextMenu.h"
#include "CursorManager.h"
#include "EventPoller.h"

namespace Amju
{
ContextMenu::ContextMenu()
{
  SetVisible(false);
}

void ContextMenu::Draw()
{
  GuiFloatingMenu::Draw();
}

bool ContextMenu::OnButtonEvent(const ButtonEvent& be)
{
  // TODO
  return false;
}

bool ContextMenu::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  // Do regular processing but reposition on R button
  GuiFloatingMenu::OnMouseButtonEvent(mbe);

  if (mbe.button == AMJU_BUTTON_MOUSE_RIGHT &&
      mbe.isDown)
  {
    if (!IsVisible())
    {
      Cursor* c = TheCursorManager::Instance()->GetCursor(0);
      SetLocalPos(c->GetPos());
      SetVisible(true);
      return true;
    }
  }
  return false;
}
}
