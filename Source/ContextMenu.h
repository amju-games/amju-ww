#ifndef CONTEXT_MENU_H
#define CONTEXT_MENU_H

#include "GuiMenu.h"

namespace Amju
{
class ContextMenu : public GuiMenu
{
public:
  ContextMenu();
  virtual ~ContextMenu();

  // GuiElement
  virtual void Draw();

  // EventListener overrides
  // Activated by right-click/B Button
  virtual void OnButtonEvent(const ButtonEvent&);
  virtual void OnMouseButtonEvent(const MouseButtonEvent&);

protected:
  bool m_isVisible;
};
typedef RCPtr<ContextMenu> PContextMenu;
}

#endif

