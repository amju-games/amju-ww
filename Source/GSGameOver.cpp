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

void GSGameOver::Update()
{
  GSText::Update();
  if (m_timer > 3.0f)
  {
    TheGame::Instance()->SetCurrentState(GSTitle::NAME);
  }
}

void GSGameOver::OnActive()
{
  GSText::OnActive();

  TheSoundManager::Instance()->PlayWav("churchbell"); // NB No file ext

  CreateText("game over");

  /*
  // Load background skybox
  // TODO We could have movement decorator etc 
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("gameover-scene.txt"));
  */
}
}
