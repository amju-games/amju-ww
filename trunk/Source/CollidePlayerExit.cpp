#include <Game.h>
#include "CollisionManager.h"
#include "Player.h"
#include "Exit.h"
#include "Viewport.h"
#include "Camera.h"
#include "GSLevelComplete.h"
#include "GSPetBonus.h"

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

  exit->OnPlayerCollision();

  // Set new camera
/*
  int id = player->GetPlayerId();
  Viewport* vp = TheViewportManager::Instance()->GetViewport(id);
  Camera* cam = vp->GetCamera();
  cam->SetTarget(exit);
  cam->SetBehaviour(new CamZoomInOnPlayer);
*/

  player->ReachedExit();

  // Set player to show in Level complete stage
  GSLevelComplete* glc = TheGSLevelComplete::Instance();
  glc->SetPlayer(player);

  // Also need player for bonus state
  TheGSPetBonus::Instance()->SetPlayer(player);

  // Skip zoom towards exit object
  TheGame::Instance()->SetCurrentState(glc);
}

static bool b1 = TheCollisionManager::Instance()->Add(
  Player::NAME, Exit::NAME, CollidePlayerExit, AMJU_FIRST_CONTACT_ONLY);
} 
