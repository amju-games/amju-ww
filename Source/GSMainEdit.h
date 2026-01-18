#ifndef GS_MAIN_EDIT_H
#define GS_MAIN_EDIT_H

#include <Singleton.h>
#include <SceneNode.h>
#include <GuiText.h>
#include "GSMain.h"
#include "ContextMenu.h"
#include "WWGameObject.h"

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

// Scene Node type for selected object
// Decorates the scene node for the selected object
class SelectedNode : public SceneNode
{
public:
  SelectedNode() : m_selNode(0) {}
  virtual void Draw();
  void SetSelNode(SceneNode* s) { m_selNode = s; }

private:
  SceneNode* m_selNode;
};

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
  void OnMove();

protected:
  // Box where new item can go, or item in box can be edited..?

  PContextMenu m_contextMenu;
  //Vec2f m_cursorPos;
  WWGameObject* m_selectedObj;
  Vec2f m_mouseScreen;
  Vec3f m_mouseWorld;
  bool m_isSelecting;

  // Scene Graph node for selected game object
  RCPtr<SelectedNode> m_selNode;

  PGuiMenu m_topMenu; // horiz menu across top

  GuiText m_infoText;

  // If true, Game Objects update and you can play
  bool m_playTestMode;
};

typedef Singleton<GSMainEdit> TheGSMainEdit;
}

#endif
