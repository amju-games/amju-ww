#include "GSLoadLevel.h"
#include "GSMain.h"
#include "GSMainEdit.h"
#include "Game.h"
#include "MySceneGraph.h"
#include "Timer.h"
#include "OnFloor.h"
#include "GameObjectFactory.h"
#include "Camera.h"
#include "ResourceManager.h"
#include "LevelManager.h"
#include <StringUtils.h>

namespace Amju
{
const char* GSLoadLevel::NAME = "load-level";

static bool b = TheGame::Instance()->AddState(GSLoadLevel::NAME, new GSLoadLevel);

void SetGameMode(GameMode mode)
{
  ((GSLoadLevel*)TheGame::Instance()->GetState(GSLoadLevel::NAME))->
    SetGameMode(mode);
}

class CommandGo : public GuiCommand
{
  virtual bool Do()
  {
    TheGame::Instance()->SetCurrentState(GSMain::NAME);
    return false; //no undo
  }
};


GSLoadLevel::GSLoadLevel()
{
  m_maxBarX = 0;
  m_numObjects = 0;
  m_currentObj = 0;
  m_mode = AMJU_MAIN_GAME_MODE;
}

void GSLoadLevel::SetGameMode(GameMode mode)
{
  m_mode = mode;
}

void GSLoadLevel::OnActive()
{
  GSText::OnActive();

  CreateText("level  " + ToString(TheLevelManager::Instance()->GetLevelId()));
  //CreateText("abcdefgh\nijklmnop\nqrstuvwxyz\n!1234567890");

  m_timer = 0;

  m_gui = LoadGui("loadlevel-gui.txt");
  Assert(m_gui);
  GuiElement* bar = m_gui->GetElementByName("bar");
  m_maxBarX = bar->GetSize().x;

  // Hide GO button until loaded
  m_gui->GetElementByName("go-button")->SetVisible(false);
  m_gui->GetElementByName("go-button")->SetCommand(new CommandGo);

  /*
  // Load background skybox
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("loadlevel-scene.txt"));
  */

  StartLoad();
}

void GSLoadLevel::OnDeactive()
{
  GameState::OnDeactive();
  m_gui = 0; // should remove itself as a listener
}

void GSLoadLevel::StartLoad()
{
  // Create a root for the game scene graph
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);

  TheLevelManager::Instance()->Open();
  m_numObjects = TheLevelManager::Instance()->GetNumObjects();
  m_currentObj = 0;
}

void GSLoadLevel::LoadOneObject()
{
  TheLevelManager::Instance()->LoadOneObject();
}

void GSLoadLevel::Update()
{
  GSText::Update();

  if (m_currentObj < m_numObjects)
  {
    LoadOneObject();
    ++m_currentObj;

    // If done, turn of prog bar and turn on GO button
    // TODO Don't do this for attract mode - go directly to level
    if (m_currentObj == m_numObjects)
    {
      m_gui->GetElementByName("go-button")->SetVisible(true);
      m_gui->GetElementByName("progressbar")->SetVisible(false);
    }
  }
  
  GuiElement* bar = m_gui->GetElementByName("bar");
  Vec2f s = bar->GetSize();
  float barSize = (float)m_currentObj / (float)m_numObjects;
  if (barSize > 1.0f)
  {
    barSize = 1.0f;
  }
  s.x = barSize * m_maxBarX;
  bar->SetSize(s);
}
}
