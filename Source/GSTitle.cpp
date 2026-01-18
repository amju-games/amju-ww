#include "GSTitle.h"
#include "Game.h"
#include "EventPoller.h"
#include "GSLoadLevel.h"
#include "SceneMesh.h"
#include "SceneGraph.h"
#include "ResourceManager.h"
#include "SoundManager.h"

namespace Amju
{
const char* GSTitle::NAME = "title";

static bool b = TheGame::Instance()->AddState(
  GSTitle::NAME, new GSTitle);

GSTitle::GSTitle()
{
}

class CommandStart : public GuiCommand
{
  virtual bool Do()
  {
    // New game: start at level 1
    // TODO Load last level ?
    ((GSLoadLevel*)TheGame::Instance()->GetState(GSLoadLevel::NAME).GetPtr())->
      SetLevel("1");
    TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME);
    return false; //no undo
  }
};

class CommandQuit : public GuiCommand
{
  virtual bool Do()
  {
    // TODO Confirm ??
    exit(0); // This should exit cleanly - TODO verify this
    return false; //no undo
  }
};

void GSTitle::OnActive()
{
  GSText::OnActive();

  // Start theme music
  TheSoundManager::Instance()->PlaySong("ww1.mod");

  // Gui and 3D Text resources - keep in mem, so don't trash in OnDeactive
  TheResourceManager::Instance()->LoadResourceGroup("2dtext-group");
  TheResourceManager::Instance()->LoadResourceGroup("3dtext-group");
  TheResourceManager::Instance()->LoadResourceGroup("gui-group");
  TheResourceManager::Instance()->LoadResourceGroup("skybox-group");

  m_gui = LoadGui("title-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("start-button")->SetCommand(new CommandStart);
  m_gui->GetElementByName("quit-button")->SetCommand(new CommandQuit);

  CreateText("amju\nwibble\nwobble");

  // Load background skybox
  // TODO We could have movement decorator etc 
  TheSceneGraph::Instance()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("title-scene.txt"));
}
}
