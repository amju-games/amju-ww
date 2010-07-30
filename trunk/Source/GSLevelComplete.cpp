#include "GSLevelComplete.h"
#include "MySceneGraph.h"
#include "Game.h"
#include "GSLoadLevel.h"
#include "LevelManager.h"
#include "Timer.h"

namespace Amju
{
const char* GSLevelComplete::NAME = "level-complete";

static bool b = TheGame::Instance()->AddState(
  GSLevelComplete::NAME, new GSLevelComplete);

GSLevelComplete::GSLevelComplete()
{
  m_timer = 0;
}

void GSLevelComplete::Update()
{
  GSText::Update();
  // Inc timer, go to next state
  m_timer += TheTimer::Instance()->GetDt();
  if (m_timer > 3.0f) // TODO CONFIG
  {
    // Increment level number done by "Exit" object
    TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME);
  }
}

void GSLevelComplete::Draw()
{
  GSText::Draw();
}

void GSLevelComplete::OnActive()
{
  GSText::OnActive();

  TheLevelManager::Instance()->Clear();

  CreateText("you did it!"); // localisation is handled in CreateText
  m_timer = 0;

  // Load background skybox
  // TODO We could have movement decorator etc 
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("levelcomplete-scene.txt"));
}
}
