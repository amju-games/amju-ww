#include "GSMenu.h"
#include "StartGame.h"
#include "Game.h"
#include "GSEditMenu.h"
#include "LevelManager.h"

namespace Amju
{
const char* GSMenu::NAME = "gs-menu";

static bool b = TheGame::Instance()->AddState(GSMenu::NAME, new GSMenu);

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

  m_gui = LoadGui("menu-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("start-button-1p")->SetCommand(new CommandStartGame1p);
  m_gui->GetElementByName("start-button-2p")->SetCommand(new CommandStartGame2p);
  m_gui->GetElementByName("editor-button")->SetCommand(new CommandEditor);
}
}

