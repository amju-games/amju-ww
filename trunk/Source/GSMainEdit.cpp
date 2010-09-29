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

  m_menu = new ContextMenu;
  m_menu->AddItem(new GuiMenuItem("Hello"));
  m_menu->AddItem(new GuiMenuItem("I am"));
  m_menu->AddItem(new GuiMenuItem("some text"));
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

