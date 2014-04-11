#include <GuiButton.h>
#include <LoadScene.h>
#include "GSTitle.h"
#include "Game.h"
#include "EventPoller.h"
#include "LevelManager.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "ResourceManager.h"
#include "SoundManager.h"
#include "GSMenu.h"
#include "GSChooseLevel.h"
#include "GSNewOrContinue.h"
#include "StartGame.h"
#include "WWLoadGui.h"

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
    TheGSTitle::Instance()->GoToNewState(TheGSNewOrContinue::Instance());
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
  TheSoundManager::Instance()->PlaySong("sound/ww1.it");

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

  // Need special shiny material for "amju" ?
  CreateText("\nrain\n bow\n drop"); // TODO Localise
  PSceneNode node = LoadScene("logo2.obj");
  Assert(node);
  node->SetIsLit(true);
  Matrix m;
  m.Scale(0.5f, 0.5f, 0.5f);
  m.TranslateKeepRotation(Vec3f(0, 0, -4)); // TODO TEMP TEST
  node->SetLocalTransform(m);
  SceneNode* root = GetTextSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(node);  
}
}
