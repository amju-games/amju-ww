#ifndef GS_MAIN_EDIT_H
#define GS_MAIN_EDIT_H

#include "GSMain.h"
#include "ContextMenu.h"
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
//  virtual void OnButtonEvent(const ButtonEvent&);
//  virtual void OnMouseButtonEvent(const MouseButtonEvent&);
 
protected:
  // Box where new item can go, or item in box can be edited..?

  PContextMenu m_menu;
};
typedef Singleton<GSMainEdit> TheGSMainEdit;
}

#endif
