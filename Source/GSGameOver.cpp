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

bool GSGameOver::OnKeyEvent(const KeyEvent&) 
{
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  return true;
}

bool GSGameOver::OnButtonEvent(const ButtonEvent&)
{
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  return true;
}

bool GSGameOver::OnMouseButtonEvent(const MouseButtonEvent&)
{
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  return true;
}

void GSGameOver::Update()
{
  GSText::Update();
  if (m_timer > 20.0f) // TODO song length
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  }
}

void GSGameOver::OnActive()
{
  GSText::OnActive();

  // TODO No loop
  TheSoundManager::Instance()->PlaySong("sound/gameover.it");

  CreateText("game over");
}
}
