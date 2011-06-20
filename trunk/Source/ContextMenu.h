#ifndef CONTEXT_MENU_H
#define CONTEXT_MENU_H

#include "GuiMenu.h"

namespace Amju
{
class ContextMenu : public GuiMenu
{
public:
  ContextMenu();

  // GuiElement
  virtual void Draw();

  // EventListener overrides
  // Activated by right-click/B Button
  virtual bool OnButtonEvent(const ButtonEvent&);
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&);

protected:
  bool m_isVisible;
};
typedef RCPtr<ContextMenu> PContextMenu;
}

#endif

