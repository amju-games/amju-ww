#include "CollisionManager.h"
#include "Player.h"
#include "Exit.h"

namespace Amju
{
void CollidePlayerExit(GameObject* go1, GameObject* go2)
{
  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Exit*>(go2));
  ((Exit*)go2)->OnPlayerCollision();
}

static bool b1 = TheCollisionManager::Instance()->Add(
  Player::NAME, Exit::NAME, &CollidePlayerExit);
} 
