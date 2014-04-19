#include <SoundManager.h>
#include <GuiButton.h>
#include "GSMenu.h"
#include "StartGame.h"
#include "Game.h"
#include "GSEditMenu.h"
#include "LevelManager.h"
#include "GameMode.h"
#include "WWLoadGui.h"

namespace Amju
{
const char* GSMenu::NAME = "gs-menu";

class CommandStartGame1p : public GuiCommand
{
  virtual bool Do()
  {
    // New game: start at level 1
    // TODO Load last level ?
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_MAIN_GAME_MODE); 
    return false; //no undo
  }
};

class CommandStartGame2p : public GuiCommand
{
  virtual bool Do()
  {
    // New game: start at level 1
    // TODO Load last level ?
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(2, AMJU_MAIN_GAME_MODE); 
    return false; //no undo
  }
};

class CommandEditor : public GuiCommand
{
  virtual bool Do()
  {
//    TheGame::Instance()->SetCurrentState(GSEditMenu::NAME);

    // TODO Move this to Edit Menu command
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_EDIT_MODE); // one "player" only for edit mode
    return false; //no undo
  }
};

void GSMenu::OnActive()
{
  GSText::OnActive();

  CreateText("");

  m_gui = WWLoadGui("menu-gui.txt");
  Assert(m_gui);

  GuiButton* start1p = (GuiButton*)m_gui->GetElementByName("start-button-1p");
  start1p->SetCommand(new CommandStartGame1p);
  start1p->SetIsFocusButton(true);
  start1p->SetShowIfFocus(true);

  m_gui->GetElementByName("start-button-2p")->SetCommand(new CommandStartGame2p);
  m_gui->GetElementByName("editor-button")->SetCommand(new CommandEditor);

  TheSoundManager::Instance()->PlaySong("sound/piano.it");
}
}

