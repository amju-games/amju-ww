#ifndef GS_MAIN_EDIT_H
#define GS_MAIN_EDIT_H

#include <Singleton.h>
#include <SceneNode.h>
#include <GuiText.h>
#include "GSMain.h"
#include "ContextMenu.h"
#include "WWGameObject.h"
#include "EditViewport.h"

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

// Selected objects - allows for multi select
typedef std::set<RCPtr<WWGameObject> > SelSet;


class GSMainEdit : public GSMain
{
private:
  GSMainEdit();
  friend class Singleton<GSMainEdit>;

public:
  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();
  virtual void OnDeactive();

  // EventListener overrides
  //virtual void OnButtonEvent(const ButtonEvent&);
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&);
  virtual bool OnCursorEvent(const CursorEvent&);  
  virtual bool OnKeyEvent(const KeyEvent&);

  // Menu item handlers
  void OnProperties();
  void OnDuplicate();
  void OnDelete();
  void OnRunStart();
  void OnRunStop();
  void OnObjectRotate(float degs); // rotate around y axis

  void SetSelectedObject(GameObject* obj);

protected:
  // Box where new item can go, or item in box can be edited..?

  PContextMenu m_contextMenu;
  //Vec2f m_cursorPos;

  // Selected objects - allows for multi select
  SelSet m_selset;

  // Rectangle for selecting
  Vec2f m_mouseScreen;
  Vec2f m_mouseScreenAnchor;
  // number of items selected in this rectangle - if none, clear selection
  int m_numSelThisRect;

  Vec3f m_mouseWorld;
  bool m_isSelecting;

  PGuiMenu m_topMenu; // horiz menu across top

  GuiText m_infoText;

  // If true, Game Objects update and you can play
  bool m_playTestMode;

  // Add movement vector to this. Actually move the selected object
  //  when we exceed some limit in one axis.
  Vec3f m_accumulatedDragMove;
  float m_gridSize; // this is the limit - effectively the size of cubes in a notional grid

  RCPtr<EditViewport> m_activeViewport;
};

typedef Singleton<GSMainEdit> TheGSMainEdit;
}

#endif
