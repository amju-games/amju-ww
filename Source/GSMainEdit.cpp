#include "GSMainEdit.h"
#include "Game.h"
#include "CursorManager.h"
#include "MySceneGraph.h"
#include "EditModeCamera.h"
#include <GuiMenu.h>

namespace Amju
{
const char* GSMainEdit::NAME = "main-edit";

GSMainEdit::GSMainEdit()
{
}

void GSMainEdit::OnActive()
{
  GSMain::OnActive();
  //GetGameSceneGraph()->SetCamera(new EditModeCamera);

  GuiMenu* childMenu = new GuiMenu;
  childMenu->AddItem(new GuiMenuItem("good"));
  childMenu->AddItem(new GuiMenuItem("Lord"));
  childMenu->AddItem(new GuiMenuItem("this"));
  childMenu->AddItem(new GuiMenuItem("seems"));
  childMenu->AddItem(new GuiMenuItem("to"));
  childMenu->AddItem(new GuiMenuItem("work"));

  m_menu = new ContextMenu;
  m_menu->AddItem(new GuiMenuItem("Hello"));
  m_menu->AddItem(new GuiMenuItem("I am"));
  m_menu->AddItem(new GuiMenuItem("some text"));
  m_menu->AddItem(new GuiNestMenuItem("I R Nested!", childMenu));

  m_menu->SetName("Parent menu");
  childMenu->SetName("Child menu");

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
}

void GSMainEdit::Draw2d()
{
  GSMain::Draw2d();
  m_menu->Draw();
  TheCursorManager::Instance()->Draw();
}

}

