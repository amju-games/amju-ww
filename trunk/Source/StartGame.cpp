#include "StartGame.h"
#include "GSLoadLevel.h"
#include "GSMain.h"
#include "GSMainEdit.h"
#include "Game.h"
#include "Screen.h"
#include "EditViewport.h"
#include "Score.h"
#include "Hud.h"
#include "EditModeCamera.h"

namespace Amju
{
void CreateEditViewports()
{
  // 4 viewports
  // Bottom left
  EditViewport* vp = new EditViewport(AMJU_BOTTOM_LEFT, 0, 0, 0.5f, 0.5f, "Top"); 
  //   id, x, y, w, h
  TheViewportManager::Instance()->AddViewport(vp);
  EditModeCamera* cam = new EditModeCamera(AMJU_EDITCAM_TOP);
  vp->SetSceneNodeCamera(cam);

  // Bottom right
  vp = new EditViewport(AMJU_BOTTOM_RIGHT, 0.5f, 0, 0.5f, 0.5f, "Front"); 
  TheViewportManager::Instance()->AddViewport(vp);
  cam = new EditModeCamera(AMJU_EDITCAM_FRONT);
  vp->SetSceneNodeCamera(cam);

  // Top left
  vp = new EditViewport(AMJU_TOP_LEFT, 0, 0.5f, 0.5f, 0.45f, "Side"); 
  TheViewportManager::Instance()->AddViewport(vp);
  cam = new EditModeCamera(AMJU_EDITCAM_SIDE);
  vp->SetSceneNodeCamera(cam);

  // Top right
  vp = new EditViewport(AMJU_TOP_RIGHT, 0.5f, 0.5f, 0.5f, 0.45f, "Persp"); 
  TheViewportManager::Instance()->AddViewport(vp);
  cam = new EditModeCamera(AMJU_EDITCAM_PERSP);
  vp->SetSceneNodeCamera(cam);
}

void CreateViewports(int numPlayers)
{
  // TODO Work out if we should be in letterbox mode
  int yMin = 0;
  int yMax = Screen::Y();

  switch (numPlayers)
  {
  case 1:
    TheViewportManager::Instance()->AddViewport(new Viewport(0, 0, 0, 1, 1));
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
      TheViewportManager::Instance()->AddViewport(new Viewport(
        0,  0, 0.5f, 1, 0.5f));

      TheViewportManager::Instance()->AddViewport(new Viewport(
        1,  0, 0,    1, 0.5f));
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
    CreateEditViewports();
  }
  else
  {
    // Create viewport for each player
    CreateViewports(numPlayers); 
  }

  // Simpler way of keeping track of simple score/lives info
  TheScores::Instance()->Reset();
  TheScores::Instance()->SetNumPlayers(numPlayers);
  TheHud::Instance()->SetNumPlayers(numPlayers);

  // TODO Hide unused player game objects ?
  // Only add players to scene graph now ?

  SetGameMode(mode);

  TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
}
}
