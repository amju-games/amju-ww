#include <Game.h>
#include <SoundManager.h>
#include <GuiButton.h>
#include <ConfigFile.h>
#include "GSNewOrContinue.h"
#include "GSChooseLevel.h"
#include "WWLoadGui.h"
#include "StartGame.h"
#include "GameConsts.h"
#include "LevelManager.h"

namespace Amju
{
static void OnChooseLevel()
{
  GSChooseLevel* gcl = TheGSChooseLevel::Instance();
  gcl->SetPrevState(TheGSNewOrContinue::Instance());
  TheGame::Instance()->SetCurrentState(gcl);
}

static void OnNew()
{
  TheLevelManager::Instance()->SetLevelId(1);
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->SetInt(CONTINUE_LEVEL_KEY, 1);
  StartGame(1, AMJU_MAIN_GAME_MODE);
}

static void OnContinue()
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  Assert(gcf->Exists(CONTINUE_LEVEL_KEY));
  int level = gcf->GetInt(CONTINUE_LEVEL_KEY, 1);
  Assert(level > 0);
  TheLevelManager::Instance()->SetLevelId(level);
  StartGame(1, AMJU_MAIN_GAME_MODE);
}

static void OnEditor()
{
  TheLevelManager::Instance()->SetLevelId(1);
  StartGame(1, AMJU_EDIT_MODE); // one "player" only for edit mode
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

  m_gui = WWLoadGui("neworcontinue-gui.txt");
  Assert(m_gui);

  // TODO Set focus element, cancel element, command handlers
  GuiButton* cont = (GuiButton*)m_gui->GetElementByName("continue-button");
  cont->SetCommand(OnContinue);
  cont->SetIsFocusButton(true);
  cont->SetShowIfFocus(true);

  m_gui->GetElementByName("new-button")->SetCommand(OnNew);
  m_gui->GetElementByName("editor-button")->SetCommand(OnEditor);
  m_gui->GetElementByName("choose-level-button")->SetCommand(OnChooseLevel);

  TheSoundManager::Instance()->PlaySong("sound/piano.it");

  // If no continue info, go directly to new game.
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  if (!gcf->Exists(CONTINUE_LEVEL_KEY))
  {
    OnNew();
    return;
  }
}

} // namespace
