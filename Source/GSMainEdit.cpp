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
const char* GSMainEdit::NAME = "main-edit";

GSMainEdit::GSMainEdit()
{
  m_isSelecting = false;
  m_selectedObj = 0;
}

void GSMainEdit::OnActive()
{
  GSMain::OnActive();
  GetGameSceneGraph()->SetCamera(new EditModeCamera);

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

      // TODO
      m_menu->Clear();
      m_menu->AddItem(new GuiMenuItem("Move " + name));
      m_menu->AddItem(new GuiMenuItem("Rotate"));
      m_menu->AddItem(new GuiMenuItem("Duplicate"));
      m_menu->AddItem(new GuiMenuItem("Delete"));
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

  }
}

void GSMainEdit::OnCursorEvent(const CursorEvent& ce)
{
}

}

