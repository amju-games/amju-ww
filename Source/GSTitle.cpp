#include <GuiButton.h>
#include "GSTitle.h"
#include "Game.h"
#include "EventPoller.h"
#include "LevelManager.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "ResourceManager.h"
#include "SoundManager.h"
#include "GSMenu.h"
#include "StartGame.h"
#include "WWLoadGui.h"

#ifdef AMJU_IOS
#define NO_MAIN_MENU
#endif

namespace Amju
{
const char* GSTitle::NAME = "title";

GSTitle::GSTitle()
{
}

class CommandStart : public GuiCommand
{
  virtual bool Do()
  {
#ifdef NO_MAIN_MENU
    // No main menu - just straight into the game..?
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_MAIN_GAME_MODE); 
#else
    // If menu state, do this INSTEAD of the above
    TheGame::Instance()->SetCurrentState(TheGSMenu::Instance());
#endif

    return false; //no undo
  }
};

class CommandQuit : public GuiCommand
{
  virtual bool Do()
  {
    // TODO Confirm ??
    exit(0); // This should exit cleanly - TODO verify this
    //TODO TheGame::Instance()->Quit();
    return false; //no undo
  }
};

void GSTitle::Update()
{
  GSText::Update();
  if (m_timer > 3000.0f) // TODO 
  {
    // Go to attract mode
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_ATTRACT_MODE); // TODO two player etc
  }
}

void GSTitle::OnActive()
{
  GSText::OnActive();

  // Start theme music
  TheSoundManager::Instance()->PlaySong("sound/ww1.mod");

  m_gui = WWLoadGui("title-gui.txt");
  Assert(m_gui);

  GuiButton* start = (GuiButton*)m_gui->GetElementByName("start-button");
  start->SetCommand(new CommandStart);
  start->SetIsFocusButton(true);
  start->SetShowIfFocus(true);

  GuiElement* quit = m_gui->GetElementByName("quit-button");
  if (quit)
  {
    quit->SetCommand(new CommandQuit);
  }

  CreateText("amju\nwibble\nwobble"); // TODO Localise
}
}
