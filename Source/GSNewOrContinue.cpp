#include <ConfigFile.h>
#include <Game.h>
#include <GuiButton.h>
#include <SoundManager.h>
#include "GameConsts.h"
#include "GSChooseLevel.h"
#include "GSHiScores.h"
#include "GSMoreMenu.h"
#include "GSNewOrContinue.h"
#include "GSOptions.h"
#include "GSTitle.h"
#include "LevelManager.h"
#include "StartGame.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnBack(GuiElement*)
{
  GSTitle* g = TheGSTitle::Instance();
  TheGame::Instance()->SetCurrentState(g);
}

static void OnHiScores(GuiElement*)
{
  GSHiScores* g = TheGSHiScores::Instance();
  g->SetPrevState(TheGSNewOrContinue::Instance());
  g->SetTarget(-1); // meaning no target, just smooth scroll
  TheGame::Instance()->SetCurrentState(g);
}

static void OnMore(GuiElement*)
{
  GSMoreMenu* g = TheGSMoreMenu::Instance();
  g->SetPrevState(TheGSNewOrContinue::Instance());
  TheGame::Instance()->SetCurrentState(g);
}

static void OnContinue(GuiElement*)
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  Assert(gcf->Exists(CONTINUE_LEVEL_KEY));
  int level = gcf->GetInt(CONTINUE_LEVEL_KEY, 1);
  Assert(level > 0);
  TheLevelManager::Instance()->SetLevelId(level);
  StartGame(1, AMJU_MAIN_GAME_MODE);
}

GSNewOrContinue::GSNewOrContinue()
{
}

void GSNewOrContinue::Update()
{
  GSText::Update();

}

void GSNewOrContinue::Draw()
{
  GSText::Draw();

}

void GSNewOrContinue::Draw2d()
{
  GSText::Draw2d();
}

void GSNewOrContinue::OnActive()
{
  GSText::OnActive();

  CreateText("");

  m_gui = WWLoadGui("gui-neworcontinue.txt");
  Assert(m_gui);

  // TODO Set focus element, cancel element, command handlers
  GuiButton* cont = (GuiButton*)m_gui->GetElementByName("continue-button");
  cont->SetCommand(OnContinue);
  cont->SetIsFocusButton(true);
  cont->SetShowIfFocus(true);

  m_gui->GetElementByName("more-button")->SetCommand(OnMore);
  m_gui->GetElementByName("hiscores-button")->SetCommand(OnHiScores);
  m_gui->GetElementByName("back-button")->SetCommand(OnBack);

  TheSoundManager::Instance()->PlaySong("sound/piano.it");

  // If no continue info, go directly to new game.
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  if (!gcf->Exists(CONTINUE_LEVEL_KEY))
  {
    // New game
    TheLevelManager::Instance()->SetLevelId(1);
    GameConfigFile* gcf = TheGameConfigFile::Instance();
    gcf->SetInt(CONTINUE_LEVEL_KEY, 1);
    StartGame(1, AMJU_MAIN_GAME_MODE);

    return;
  }
}

} // namespace
