#ifndef GS_MAIN_EDIT_H
#define GS_MAIN_EDIT_H

#include "GSMain.h"
#include "ContextMenu.h"
#include "WWGameObject.h"
#include <Singleton.h>

namespace Amju
{
// Editor mode
// Controls: 
// Cursor: moves box; you can create a new game object in the box, or if there
// is already a game object in the box, you can edit it.
// Box movement is essentially 2D..?
// Right-click/B button on box for context menu 
// Context menu items:
// - New object - go to menu list of object types
// - Edit object properties
// - Move object
// Right click/B button off box for main menu
// Main menu items:
// - Play Test/Stop Test
// - Save ? Or auto save all changes ?
// - Upload to server ?
// - Quit (to Edit Menu)
// - Skybox properties
// - Level name/number
// - Help ?
class GSMainEdit : public GSMain
{
private:
  GSMainEdit();
  friend class Singleton<GSMainEdit>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

  // EventListener overrides
  //virtual void OnButtonEvent(const ButtonEvent&);
  virtual void OnMouseButtonEvent(const MouseButtonEvent&);
  virtual void OnCursorEvent(const CursorEvent&);  

  // Menu item handlers
  void OnMove();

protected:
  // Box where new item can go, or item in box can be edited..?

  PContextMenu m_menu;
  //Vec2f m_cursorPos;
  WWGameObject* m_selectedObj;
  Vec2f m_mouseScreen;
  Vec3f m_mouseWorld;
  bool m_isSelecting;
};
typedef Singleton<GSMainEdit> TheGSMainEdit;
}

#endif
