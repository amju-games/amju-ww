#include "GSGameOver.h"
#include "GSTitle.h"
#include "GSLoadLevel.h"
#include "Game.h"
#include "MySceneGraph.h"
#include "SoundManager.h"

namespace Amju
{
const char* GSGameOver::NAME = "gameover";

static bool b = TheGame::Instance()->AddState(GSGameOver::NAME, new GSGameOver);

GSGameOver::GSGameOver()
{
}

class CommandContinue : public GuiCommand
{
  virtual bool Do()
  {
    // Reload current level
    TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME);
    return false; //no undo
  }
};

class CommandMainMenu : public GuiCommand
{
  virtual bool Do()
  {
    TheGame::Instance()->SetCurrentState(GSTitle::NAME);
    return false; //no undo
  }
};

void GSGameOver::OnActive()
{
  GSText::OnActive();

  TheSoundManager::Instance()->PlayWav("churchbell"); // NB No file ext

  m_gui = LoadGui("gameover-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("continue-button")->SetCommand(new CommandContinue);
  m_gui->GetElementByName("mainmenu-button")->SetCommand(new CommandMainMenu);

  CreateText("game over");

  // Load background skybox
  // TODO We could have movement decorator etc 
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("gameover-scene.txt"));
}
}
