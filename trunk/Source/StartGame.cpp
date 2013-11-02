#include "StartGame.h"
#include "GSLoadLevel.h"
#include "GSMain.h"
#include "GSMainEdit.h"
#include "Game.h"
#include "PlayerInfo.h"
#include "PlayerInfoKey.h"
#include "Screen.h"
#include "EditViewport.h"

namespace Amju
{
void CreateEditViewport()
{
  TheViewportManager::Instance()->
    AddViewport(new EditViewport(0, 0, 0, Screen::X(), Screen::Y()));
}

void CreateViewports(int numPlayers)
{
  // TODO Work out if we should be in letterbox mode
  int yMin = 0;
  int yMax = Screen::Y();

  switch (numPlayers)
  {
  case 1:
    TheViewportManager::Instance()->AddViewport(new Viewport(0, 0, yMin, Screen::X(), yMax));
    break;
  case 2:
    {
      int x = Screen::X() / 2;
      int BORDER = 2;
      TheViewportManager::Instance()->AddViewport(new Viewport(0,  0, yMin, x - BORDER, yMax));
      TheViewportManager::Instance()->AddViewport(new Viewport(1,  x + BORDER, yMin, x - BORDER, yMax));
    }
    break;
  default:
    Assert(0);
  }
}

void StartGame(int numPlayers, GameMode mode)
{
  TheViewportManager::Instance()->ClearViewports();
  if (mode == AMJU_EDIT_MODE)
  {
    CreateEditViewport();
  }
  else
  {
    // Create viewport for each player
    CreateViewports(numPlayers); 
  }

  // Create PlayerInfo for each player
  PlayerInfoManager* pim = ThePlayerInfoManager::Instance();
  pim->Init(numPlayers);
  // Start number of lives
  for (int i = 0; i < numPlayers; i++)
  {
    pim->GetPlayerInfo(i)->Set(PlayerInfoKey::LIVES, 3);
  }

  // TODO Hide unused player game objects ?
  // Only add players to scene graph now ?

  SetGameMode(mode);

  TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
}
}
