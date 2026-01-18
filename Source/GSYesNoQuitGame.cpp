#include <AmjuFirst.h>
#include <Game.h>
#include "GSYesNoQuitGame.h"
#include "GSTitle.h"
#include <AmjuFinal.h>

namespace Amju
{
GSYesNoQuitGame::GSYesNoQuitGame()
{
  m_question = "Do you really want to quit?";
  m_yesText = "yes";
  m_noText = "no";
}

void GSYesNoQuitGame::OnYes()
{
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
}

}


