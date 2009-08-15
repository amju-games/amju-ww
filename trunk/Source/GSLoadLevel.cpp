#include "GSLoadLevel.h"
#include "GSMain.h"
#include "Game.h"
#include "SceneGraph.h"
#include "Timer.h"
#include "OnFloor.h"
#include "GameObjectFactory.h"
#include "SceneGameObject.h"
#include "Camera.h"

namespace Amju
{
const char* GSLoadLevel::NAME = "load-level";

static bool b = TheGame::Instance()->AddState(GSLoadLevel::NAME, new GSLoadLevel);

GSLoadLevel::GSLoadLevel()
{
  m_maxBarX = 0;
  m_numObjects = 0;
  m_currentObj = 0;
}

void GSLoadLevel::OnActive()
{
  GSText::OnActive();

  CreateText("level " + m_level);
  m_timer = 0;

  m_gui = LoadGui("loadlevel-gui.txt");
  Assert(m_gui);
  GuiElement* bar = m_gui->GetElementByName("bar");
  m_maxBarX = bar->GetSize().x;

  // Load background skybox
  // TODO We could have movement decorator etc 
  TheSceneGraph::Instance()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("loadlevel-scene.txt"));

  StartLoad();
}

void GSLoadLevel::OnDeactive()
{
  GameState::OnDeactive();
  m_gui = 0; // should remove itself as a listener
  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, m_pRoot);
}

void GSLoadLevel::StartLoad()
{
  TheGame::Instance()->ClearGameObjects();
  OnFloor::ClearFloors();

  std::string levelfilename = "level-" + m_level + ".txt";

  m_file = new File;
  if (!m_file->OpenRead(levelfilename))
  {
    Assert(0);
  }

  m_numObjects = 0;
  m_currentObj = 0;
  m_file->GetInteger(&m_numObjects);

  m_pRoot = new SceneNode;
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

  ////    pgo->AddToSceneGraph(); // ?????
  TheGame::Instance()->AddGameObject(pgo);

  SceneGameObjectOpaque* node = new SceneGameObjectOpaque(pgo);
  m_pRoot->AddChild(node);

  // If camera, tell SceneGraph that this node is the camera
  Camera* camera = dynamic_cast<Camera*>(pgo.GetPtr());
  if (camera)
  {
    node->SetIsCamera(true);
    TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_CAMERA, node);
  }
  else
  {
    PSceneNode shadow = new SceneGameObjectBlended(pgo);
    node->AddChild(shadow);
  }
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
  }

  // Inc timer, go to next state when we have paused long enough
  m_timer += TheTimer::Instance()->GetDt();
  //if (m_timer > 3.0f) // TODO CONFIG
  //{
  //  TheGame::Instance()->SetCurrentState(GSMain::NAME);
  //}

  GuiElement* bar = m_gui->GetElementByName("bar");
  Vec2f s = bar->GetSize();
  float barSize = (float)m_currentObj / (float)m_numObjects;
  if (barSize > 1.0f)
  {
    barSize = 1.0f;
  }
  s.x = barSize * m_maxBarX;
  bar->SetSize(s);

  if (m_currentObj == m_numObjects && m_timer > 5.0f)
  {
    m_file = 0; // delete, we no longer need it
    TheGame::Instance()->SetCurrentState(GSMain::NAME);
  }
}
}
