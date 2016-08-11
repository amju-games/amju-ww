#include <AmjuFirst.h>
#include <ConfigFile.h>
#include <Game.h>
#include "GameConsts.h"
#include "GSYesNoNewGame.h"
#include "GSTitle.h"
#include "LevelManager.h"
#include "StartGame.h"
#include <AmjuFinal.h>

namespace Amju
{
GSYesNoNewGame::GSYesNoNewGame()
{
  m_question = "Do you really want to start a new game?";
  m_yesText = "yes";
  m_noText = "no";
}

void GSYesNoNewGame::OnYes()
{
  TheLevelManager::Instance()->SetLevelId(1);
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->SetInt(CONTINUE_LEVEL_KEY, 1);
  StartGame(1, AMJU_MAIN_GAME_MODE);
}

}


