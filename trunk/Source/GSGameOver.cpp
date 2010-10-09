#include "GSGameOver.h"
#include "GSTitle.h"
#include "GSLoadLevel.h"
#include "Game.h"
#include "MySceneGraph.h"
#include "PlayWav.h"

namespace Amju
{
const char* GSGameOver::NAME = "gameover";

GSGameOver::GSGameOver()
{
}

void GSGameOver::Update()
{
  GSText::Update();
  if (m_timer > 3.0f) // TODO Or tapped
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  }
}

void GSGameOver::OnActive()
{
  GSText::OnActive();

  PlayWav("churchbell"); 

  CreateText("game over");

  /*
  // Load background skybox
  // TODO We could have movement decorator etc 
  GetTextSceneGraph()->SetRootNode(
    SceneGraph::AMJU_SKYBOX, LoadScene("gameover-scene.txt"));
  */
}
}
