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

//#define NO_MAIN_MENU

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
    StartGame(1, AMJU_MAIN_GAME_MODE); // TODO two player etc
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

void GSTitle::OnActive()
{
  GSText::OnActive();

  TheResourceManager::Instance()->LoadResourceGroup("music-group");
  // Start theme music
  TheSoundManager::Instance()->PlaySong("sound/ww1.mod");

#ifdef GEKKO
  TheResourceManager::Instance()->LoadResourceGroup("wii-sound-group");
#else
  // Etc
  TheResourceManager::Instance()->LoadResourceGroup("windows-sound-group");
#endif

  // Gui and 3D Text resources - keep in mem, so don't trash in OnDeactive
  // TODO Load while logos are displayed ?
  TheResourceManager::Instance()->LoadResourceGroup("3dtext-group");
  TheResourceManager::Instance()->LoadResourceGroup("gui-group");
  //TheResourceManager::Instance()->LoadResourceGroup("skybox-group");

  m_gui = LoadGui("title-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("start-button")->SetCommand(new CommandStart);
  GuiElement* quit = m_gui->GetElementByName("quit-button");
  if (quit)
  {
    quit->SetCommand(new CommandQuit);
  }

  CreateText("amju\nwibble\nwobble"); // TODO Localise

  // Load background skybox
  // TODO We could have movement decorator etc 
  /*
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("title-scene.txt"));
  */
}
}
