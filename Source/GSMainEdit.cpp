#include "GSMainEdit.h"
#include "Game.h"
#include "CursorManager.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"
#include <Unproject.h>
#include <ClipLineSegBox.h>
#include <GuiMenu.h>
#include <GameObjectFactory.h>

namespace Amju
{
void SelectedNode::Draw()
{
  if (!m_selNode)
  {
    return;
  }

  // TODO Switch to front face culling
  AmjuGL::PushMatrix();
//  AmjuGL::PushAttrib(AmjuGL::AMJU_LIGHTING | AmjuGL::AMJU_TEXTURE_2D);
//  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);
//  AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
  PushColour();
  AmjuGL::SetColour(0, 0, 0); 
  //static const float s = 1.1f;
  //AmjuGL::Scale(s, s, s);

  m_selNode->Draw();

  PopColour();
  AmjuGL::PopMatrix();
//  AmjuGL::PopAttrib();
}

// Menu item handlers
void OnMove()
{
  TheGSMainEdit::Instance()->OnMove();
}

void OnNewLevelBlock()
{
}

void OnLoadLevelBlock()
{
}

void OnSaveLevelBlock()
{
}

void OnRotate()
{
}

void OnDuplicate()
{
}

void OnDelete()
{
}

void OnProperties()
{
}


GSMainEdit::GSMainEdit()
{
  m_isSelecting = false;
  m_selectedObj = 0;
  m_selNode = new SelectedNode; 

  // Set up top menu 
  m_topMenu = new GuiMenu;
  m_topMenu->SetIsVertical(false);
  m_topMenu->SetLocalPos(Vec2f(-0.9f, 0.8f));

  GuiMenu* fileSubmenu = new GuiMenu;
  fileSubmenu->AddChild(new GuiMenuItem("New level block", OnNewLevelBlock));
  fileSubmenu->AddChild(new GuiMenuItem("Load level block", OnLoadLevelBlock));
  fileSubmenu->AddChild(new GuiMenuItem("Save level block", OnSaveLevelBlock));

  GuiMenu* newObjSubmenu = new GuiMenu;
  // Get types from Game Obj factory
  std::vector<std::string> names = TheGameObjectFactory::Instance()->GetTypeNames();
  for (unsigned int i = 0; i < names.size(); i++)
  {
    newObjSubmenu->AddChild(new GuiMenuItem(names[i]));
  }

  m_topMenu->AddChild(new GuiNestMenuItem("File", fileSubmenu));
  m_topMenu->AddChild(new GuiNestMenuItem("New Object", newObjSubmenu));
}

void GSMainEdit::OnMove()
{
  // Change mode so arrow keys move currently selected object
}

void GSMainEdit::OnActive()
{
  GSMain::OnActive();
  GetGameSceneGraph()->SetCamera(new EditModeCamera);
  
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->AddChild(m_selNode.GetPtr()); // TODO how to ensure we only add it once ?

  // Initial option is to load a block

  /*
  GuiMenu* childMenu = new GuiMenu;
  childMenu->SetName("Child menu");
  childMenu->AddChild(new GuiMenuItem("good"));
  childMenu->AddChild(new GuiMenuItem("Lord"));
  childMenu->AddChild(new GuiMenuItem("this"));
  childMenu->AddChild(new GuiMenuItem("seems"));
  childMenu->AddChild(new GuiMenuItem("to"));
  childMenu->AddChild(new GuiMenuItem("work"));
  */

  m_contextMenu = new ContextMenu;
  m_contextMenu->AddChild(new GuiMenuItem("New block"));
  m_contextMenu->AddChild(new GuiMenuItem("Load block..."));
  /*
  m_contextMenu->AddChild(new GuiMenuItem("I am"));
  m_contextMenu->AddChild(new GuiMenuItem("some text"));
  m_contextMenu->AddChild(new GuiNestMenuItem("I R Nested!", childMenu));
  */

  m_contextMenu->SetName("Parent menu");

  m_contextMenu->SetVisible(false);
}

void GSMainEdit::Update()
{
  GSMain::Update();

  // Don't update game objects; don't check collisions
  //GetGameSceneGraph()->Update();
}

void GSMainEdit::Draw()
{
  GSMain::Draw();

  if (m_isSelecting)
  {
    m_isSelecting = false;
    m_selectedObj = 0;

    GetGameSceneGraph()->GetCamera()->Draw();

    Vec3f mouseWorldNear;
    Vec3f mouseWorldFar;

    Unproject(Vec2f(m_mouseScreen.x, m_mouseScreen.y), 0, &mouseWorldNear);
    Unproject(Vec2f(m_mouseScreen.x, m_mouseScreen.y), 1, &mouseWorldFar);
    LineSeg lineSeg(mouseWorldNear, mouseWorldFar);

/*
    // Draw for debugging
    std::cout << "Selecting, mouse: x: " << m_mouseScreen.x << " y: " << m_mouseScreen.y << "\n";
    AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
    AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);
    AmjuGL::DrawLine(AmjuGL::Vec3(mouseWorldNear.x + 0.1f, mouseWorldNear.y + 0.1f, mouseWorldNear.z),
      AmjuGL::Vec3(mouseWorldFar.x, mouseWorldFar.y, mouseWorldFar.z));
    AmjuGL::PopAttrib();
*/

    GameObjects* objs = TheGame::Instance()->GetGameObjects();
    float bestDist = 999999.9f;
    for (GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
    {
      GameObject* pgo = it->second;
      Assert(pgo);
      const AABB& aabb = pgo->GetAABB();
      if (Clip(lineSeg, aabb, 0))
      {
        // Line seg intersects this box
        Assert(dynamic_cast<WWGameObject*>(pgo));
        // Choose object whose centre (position) is closest to line seg..?
        float dist = LineSeg(mouseWorldNear, mouseWorldFar).SqDist(pgo->GetPos());
        //float dist = (mouseWorldNear - pgo->GetPos()).SqLen(); // pick closest
        if (dist < bestDist)
        {
          bestDist = dist;
          m_selectedObj = (WWGameObject*)pgo;
        }
      }
    }
    if (m_selectedObj)
    {
      const std::string name = m_selectedObj->GetTypeName();
      std::cout << "Selected " << name << " ID: " << m_selectedObj->GetId() << "\n";

      // Set m_selNode to decorate node for the selected game object (assume all Game objects have a scene node)
      m_selNode->SetSelNode(m_selectedObj->GetSceneNode());

      // TODO
      m_contextMenu->Clear();
      m_contextMenu->AddChild(new GuiMenuItem("Move " + name, Amju::OnMove));
      m_contextMenu->AddChild(new GuiMenuItem("Rotate", OnRotate));
      m_contextMenu->AddChild(new GuiMenuItem("Duplicate", OnDuplicate));
      m_contextMenu->AddChild(new GuiMenuItem("Delete", OnDelete));
      m_contextMenu->AddChild(new GuiMenuItem("Properties...", OnProperties));
    }
    else
    {
      m_contextMenu->Clear();
      m_contextMenu->AddChild(new GuiMenuItem("Nothing selected"));
    }
  }
}

void GSMainEdit::Draw2d()
{
  GSMain::Draw2d();
  m_topMenu->SetVisible(true); // always visible
  m_topMenu->Draw();
  m_contextMenu->Draw();
  TheCursorManager::Instance()->Draw();
}

bool GSMainEdit::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  switch (mbe.button)
  {
  case AMJU_BUTTON_MOUSE_LEFT:
    // Select an object. Convert cursor pos to world coords at front and back of frustum.
    // Find nearest object which intersects line seg.
    if (mbe.isDown)
    {
      m_mouseScreen.x = mbe.x;
      m_mouseScreen.y = mbe.y;
      m_isSelecting = true;
      return true;
    }
    break;

  default:
    break;
  }

  return false;
}

bool GSMainEdit::OnCursorEvent(const CursorEvent& ce)
{
  // TODO
  return false;
}

}

