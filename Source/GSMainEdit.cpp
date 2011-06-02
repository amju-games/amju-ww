#include "GSMainEdit.h"
#include "Game.h"
#include "CursorManager.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"
#include "Unproject.h"
#include <ClipLineSegBox.h>
#include <GuiMenu.h>

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
  static const float s = 1.1f;
  AmjuGL::Scale(s, s, s);

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
  childMenu->AddItem(new GuiMenuItem("good"));
  childMenu->AddItem(new GuiMenuItem("Lord"));
  childMenu->AddItem(new GuiMenuItem("this"));
  childMenu->AddItem(new GuiMenuItem("seems"));
  childMenu->AddItem(new GuiMenuItem("to"));
  childMenu->AddItem(new GuiMenuItem("work"));
  */

  m_menu = new ContextMenu;
  m_menu->AddItem(new GuiMenuItem("New block"));
  m_menu->AddItem(new GuiMenuItem("Load block..."));
  /*
  m_menu->AddItem(new GuiMenuItem("I am"));
  m_menu->AddItem(new GuiMenuItem("some text"));
  m_menu->AddItem(new GuiNestMenuItem("I R Nested!", childMenu));
  */

  m_menu->SetName("Parent menu");

  m_menu->SetVisible(false);
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

    Game::GameObjects* objs = TheGame::Instance()->GetGameObjects();
    float bestDist = 999999.9f;
    for (Game::GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
    {
      GameObject* pgo = it->second;
      Assert(pgo);
      AABB* aabb = pgo->GetAABB();
      if (aabb && Clip(lineSeg, *aabb, 0))
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
      m_menu->Clear();
      m_menu->AddItem(new GuiMenuItem("Move " + name, Amju::OnMove));
      m_menu->AddItem(new GuiMenuItem("Rotate", OnRotate));
      m_menu->AddItem(new GuiMenuItem("Duplicate", OnDuplicate));
      m_menu->AddItem(new GuiMenuItem("Delete", OnDelete));
      m_menu->AddItem(new GuiMenuItem("Properties...", OnProperties));
    }
    else
    {
      m_menu->Clear();
      m_menu->AddItem(new GuiMenuItem("Nothing selected"));
    }

    //AmjuGL::PushAttrib(AmjuGL::AMJU_TEXTURE_2D);
    //AmjuGL::Disable(AmjuGL::AMJU_TEXTURE_2D);

    //AmjuGL::DrawLine(
    //  AmjuGL::Vec3(mouseWorldFar.x, mouseWorldFar.y, mouseWorldFar.z),
    //  AmjuGL::Vec3(mouseWorldNear.x, mouseWorldNear.y, mouseWorldNear.z)
    //);

    //AmjuGL::PopAttrib();
  }
}

void GSMainEdit::Draw2d()
{
  GSMain::Draw2d();
  m_menu->Draw();
  TheCursorManager::Instance()->Draw();
}

void GSMainEdit::OnMouseButtonEvent(const MouseButtonEvent& mbe)
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
    }
    break;
  default:
    break;
  }
}

void GSMainEdit::OnCursorEvent(const CursorEvent& ce)
{
}

}

