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
  TheGSDebug::Instance()->GoBack();
}

static void OnChooseLevel(GuiElement*)
{
  GSChooseLevel* gcl = TheGSChooseLevel::Instance();
  gcl->SetPrevState(TheGSDebug::Instance());
  TheGame::Instance()->SetCurrentState(gcl);
}

static void OnEditor(GuiElement*)
{
  TheLevelManager::Instance()->SetLevelId(1);
  StartGame(1, AMJU_EDIT_MODE); // one "player" only for edit mode
}

GSDebug::GSDebug()
{
}

void GSDebug::Update()
{
  GSText::Update();

}

void GSDebug::Draw()
{
  GSText::Draw();

}

void GSDebug::Draw2d()
{
  GSText::Draw2d();
}

void GSDebug::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-debug.txt");
  Assert(m_gui);

  GetElementByName(m_gui, "choose-level-button")->SetCommand(OnChooseLevel);
  GetElementByName(m_gui, "editor-button")->SetCommand(OnEditor);
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
}

} // namespace
