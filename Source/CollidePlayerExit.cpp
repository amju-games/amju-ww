#include "CollisionManager.h"
#include "Player.h"
#include "Exit.h"
#include "Viewport.h"
#include "Camera.h"

namespace Amju
{
void CollidePlayerExit(Player* player, Exit* exit)
{
  if (exit->IsExiting())
  {
    return; // already processed this collision
  }

  exit->OnPlayerCollision();

  // Set new camera
  int id = player->GetPlayerId();
  Viewport* vp = TheViewportManager::Instance()->GetViewport(id);
  Camera* cam = vp->GetCamera();
  cam->SetBehaviour(new CamZoomInOnPlayer);

  // Set player to face camera and do special animation
  player->SetDir(180.0f);
  //player->SetAnim("jump"); // TODO
}

static bool b1 = TheCollisionManager::Instance()->Add(
  Player::NAME, Exit::NAME, (CollisionManager::CollisionHandler)CollidePlayerExit);
} 
