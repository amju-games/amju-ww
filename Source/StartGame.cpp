#include "StartGame.h"
#include "GSLoadLevel.h"
#include "GSMain.h"
#include "GSMainEdit.h"
#include "Game.h"
#include "Screen.h"
#include "EditViewport.h"
#include "Score.h"
#include "Hud.h"

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
#ifdef VERTICAL_SPLIT
      int x = Screen::X() / 2;
      int BORDER = 2;
      TheViewportManager::Instance()->AddViewport(new Viewport(0,  0, yMin, x - BORDER, yMax));
      TheViewportManager::Instance()->AddViewport(new Viewport(1,  x + BORDER, yMin, x - BORDER, yMax));

#else
      // Horizontal split
      int xMax = Screen::X();
      int yMid = Screen::Y() / 2;
      TheViewportManager::Instance()->AddViewport(new Viewport(
        0,  0, yMid, xMax, yMid));

      TheViewportManager::Instance()->AddViewport(new Viewport(
        1,  0, 0,    xMax, yMid));
#endif
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

  // Simpler way of keeping track of simple score/lives info
  Score::Reset();
  Score::SetNumPlayers(numPlayers);
  TheHud::Instance()->SetNumPlayers(numPlayers);

  // TODO Hide unused player game objects ?
  // Only add players to scene graph now ?

  SetGameMode(mode);

  TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
}
}
