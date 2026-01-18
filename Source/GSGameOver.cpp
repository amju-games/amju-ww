#include <SoundManager.h>
#include "GSGameOver.h"
#include "GSTitle.h"
#include "GSLoadLevel.h"
#include "Game.h"
#include "MySceneGraph.h"
#include "PlayWav.h"
#include "Hud.h"

namespace Amju
{
const char* GSGameOver::NAME = "gameover";

GSGameOver::GSGameOver()
{
}

void GSGameOver::Draw2d()
{
  GSText::Draw2d();
  TheHud::Instance()->Draw();
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
  TheSoundManager::Instance()->PlaySong("gameover.it");

  CreateText("game over");
}
}
