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

namespace Amju
{
const char* GSLoadLevel::NAME = "load-level";

static bool b = TheGame::Instance()->AddState(GSLoadLevel::NAME, new GSLoadLevel);

void SetLevel(const std::string& levelName)
{
  ((GSLoadLevel*)TheGame::Instance()->GetState(GSLoadLevel::NAME))->
    SetLevel(levelName);
}

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

  CreateText("level  " + m_level);
  //CreateText("abcdefgh\nijklmnop\nqrstuvwxyz\n!1234567890");

  m_timer = 0;

  m_gui = LoadGui("loadlevel-gui.txt");
  Assert(m_gui);
  GuiElement* bar = m_gui->GetElementByName("bar");
  m_maxBarX = bar->GetSize().x;

  // Hide GO button until loaded
  m_gui->GetElementByName("go-button")->SetVisible(false);
  m_gui->GetElementByName("go-button")->SetCommand(new CommandGo);

  // Load background skybox
  // TODO We could have movement decorator etc 
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("loadlevel-scene.txt"));

  StartLoad();
}

void GSLoadLevel::OnDeactive()
{
  GameState::OnDeactive();
  m_gui = 0; // should remove itself as a listener
}

void GSLoadLevel::StartLoad()
{
  TheGame::Instance()->ClearGameObjects();
  OnFloor::ClearFloors();

  // TODO trash resource group for previous level

  std::string groupname = "levels/level-" + m_level + "-group";
  TheResourceManager::Instance()->LoadResourceGroup(groupname);

  std::string levelfilename = "levels/level-" + m_level + ".txt";

  m_file = new File;
  if (!m_file->OpenRead(levelfilename))
  {
    Assert(0);
  }

  m_numObjects = 0;
  m_currentObj = 0;
  m_file->GetInteger(&m_numObjects);

  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("levelcomplete-scene.txt"));

  // Create a root for the game scene graph
  GetGameSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, new SceneNode);
}

void GSLoadLevel::LoadOneObject()
{
  std::string s;
  m_file->GetDataLine(&s);
  PGameObject pgo = TheGameObjectFactory::Instance()->Create(s);
  Assert(pgo);

  if (!pgo->Load(m_file))
  {
    m_file->ReportError("Error loading object; type:" + s);
    Assert(0);
  }

  std::string end;
  if (!m_file->GetDataLine(&end) || end != "end")
  {
    m_file->ReportError("Expected \"end\" after object; type: " + s);
    Assert(0);
  }

  // GameObject adds node(s) to SceneGraph
  // Done in Load()

  TheGame::Instance()->AddGameObject(pgo);
}

void GSLoadLevel::SetLevel(const std::string& level)
{
  m_level = level;
}

const std::string& GSLoadLevel::GetLevel() const
{
  return m_level;
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
      m_file = 0; // delete, we no longer need it
      m_gui->GetElementByName("go-button")->SetVisible(true);
      m_gui->GetElementByName("progressbar")->SetVisible(false);
    }
  }

  // Go to next state when we have paused long enough ?
  // Or progress bar turns into button..?
  
  GuiElement* bar = m_gui->GetElementByName("bar");
  Vec2f s = bar->GetSize();
  float barSize = (float)m_currentObj / (float)m_numObjects;
  if (barSize > 1.0f)
  {
    barSize = 1.0f;
  }
  s.x = barSize * m_maxBarX;
  bar->SetSize(s);

  /*
  if (m_currentObj == m_numObjects) //&& m_timer > 3.0f)
  {
    m_file = 0; // delete, we no longer need it

    switch (m_mode)
    {
    case AMJU_MAIN_GAME_MODE:
      TheGame::Instance()->SetCurrentState(GSMain::NAME);
      break;
    
    case AMJU_ATTRACT_MODE:
      TheGame::Instance()->SetCurrentState(GSMainAttract::NAME);
      break;
    
    case AMJU_EDIT_MODE:
      TheGame::Instance()->SetCurrentState(GSMainEdit::NAME);
      break;
    }
  }
  */
}
}
