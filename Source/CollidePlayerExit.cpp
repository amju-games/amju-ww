#include <Game.h>
#include "CollisionManager.h"
#include "Player.h"
#include "Exit.h"
#include "Viewport.h"
#include "Camera.h"
#include "GSLevelComplete.h"
#include "GSPetBonus.h"
#include "GSMain.h"
#include "Depth.h"

namespace Amju
{
void CollidePlayerExit(GameObject* go1, GameObject* go2)
{
  Player* player = dynamic_cast<Player*>(go1);
  Assert(player);
  Exit* exit = dynamic_cast<Exit*>(go2);
  Assert(exit);

  if (exit->IsExiting())
  {
    return; // already processed this collision
  }

  SetScrollSpeed(0); // stop scrolling, right?

  exit->OnPlayerCollision();

  // Set new camera
  Camera* cam = GetActiveCamera();
  Assert(cam);
  cam->SetTarget(exit);
  cam->SetBehaviour(new CamZoomInOnPlayer);
  cam->SetEarthquake(1.0f); // TODO CONFIG

  player->ReachedExit(exit);

  // Set player to show in Level complete stage
  GSLevelComplete* glc = TheGSLevelComplete::Instance();
  glc->SetPlayer(player);

  // Also need player for bonus state
  TheGSPetBonus::Instance()->SetPlayer(player);

  TheGSMain::Instance()->SetExitState(GSMain::IS_EXITING);

  // Skip zoom towards exit object
//  TheGame::Instance()->SetCurrentState(glc);
}

#ifdef GLOBAL_INIT
static bool b1 = TheCollisionManager::Instance()->Add(
  Player::NAME, Exit::NAME, CollidePlayerExit, AMJU_FIRST_CONTACT_ONLY);
#endif

} 
