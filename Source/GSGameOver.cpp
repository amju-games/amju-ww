#include <GuiButton.h>
#include <SoundManager.h>
#include "GSGameOver.h"
#include "GSTitle.h"
#include "GSLoadLevel.h"
#include "GSYouGotHiScore.h"
#include "Game.h"
#include "HiScoreDb.h"
#include "Hud.h"
#include "MySceneGraph.h"
#include "PlayWav.h"
#include "Score.h"
#include "StartGame.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnContinue(GuiElement*)
{
  // Always go back to title, but check for hi score
  const int TOP_N = 10; // TODO
  // TODO Just checking single player score
  int score = TheScores::Instance()->GetScore(AMJU_P1);
  if (TheLocalHiScoreDb::Instance()->IsScoreTopN(score, TOP_N))
  {
    TheGame::Instance()->SetCurrentState(TheGSYouGotHiScore::Instance());
  }
  else
  {
    TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  }
}

////const char* GSGameOver::NAME = "gameover";

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
//  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  return true;
}

bool GSGameOver::OnMouseButtonEvent(const MouseButtonEvent&)
{
//  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
  return true;
}

void GSGameOver::Update()
{
  GSText::Update();
  if (m_timer > 15.0f) // TODO song length
  {
    ////TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
    OnContinue(nullptr);
  }
}

static void OnMainMenu(GuiElement*)
{
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
}

void GSGameOver::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-gameover.txt");
  Assert(m_gui);

  GuiButton* cont = (GuiButton*)m_gui->GetElementByName("continue-button");
  cont->SetCommand(OnContinue);
  cont->SetIsFocusButton(true);
  cont->SetShowIfFocus(true);

//  GuiElement* quit = m_gui->GetElementByName("mainmenu-button");
//  if (quit)
//  {
//    quit->SetCommand(OnMainMenu);
//  }
  
  // TODO No loop
  TheSoundManager::Instance()->PlaySong("sound/gameover.it");

  CreateText("game\n over");
}
}
