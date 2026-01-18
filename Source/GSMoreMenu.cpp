#include <Game.h>
#include "GameConsts.h"
#include "GSAbout.h"
#include "GSChooseLevel.h"
#include "GSDebug.h"
#include "GSMoreMenu.h"
#include "GSNewOrContinue.h"
#include "GSOptions.h"
#include "GSTitle.h"
#include "GSYesNoNewGame.h"
#include "LevelManager.h"
#include "StartGame.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnBack(GuiElement*)
{
  GSNewOrContinue* g = TheGSNewOrContinue::Instance();
  TheGame::Instance()->SetCurrentState(g);
}

static void OnDebug(GuiElement*)
{
  GSDebug* g = TheGSDebug::Instance();
  g->SetPrevState(TheGame::Instance()->GetState());
  TheGame::Instance()->SetCurrentState(g);
}

static void OnOptions(GuiElement*)
{
  GSOptions* go = TheGSOptions::Instance();
  go->SetPrevState(TheGame::Instance()->GetState());
  TheGame::Instance()->SetCurrentState(go);
}

static void OnAbout(GuiElement*)
{
  GSAbout* g = TheGSAbout::Instance();
  g->SetPrevState(TheGame::Instance()->GetState());
  TheGame::Instance()->SetCurrentState(g);
}

static void OnNew(GuiElement*)
{
  GSYesNoNewGame* g = TheGSYesNoNewGame::Instance();
  g->SetPrevState(TheGame::Instance()->GetState());
  TheGame::Instance()->SetCurrentState(g);
}

GSMoreMenu::GSMoreMenu()
{
}

void GSMoreMenu::Update()
{
  GSText::Update();

}

void GSMoreMenu::Draw()
{
  GSText::Draw();

}

void GSMoreMenu::Draw2d()
{
  GSText::Draw2d();
}

void GSMoreMenu::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-menu-more.txt");
  Assert(m_gui);

  CreateText("");

  GetElementByName(m_gui, "new-button")->SetCommand(OnNew);
  GetElementByName(m_gui, "options-button")->SetCommand(OnOptions);
  GetElementByName(m_gui, "about-button")->SetCommand(OnAbout);
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
  GetElementByName(m_gui, "debug-button")->SetCommand(OnDebug);

}

} // namespace
