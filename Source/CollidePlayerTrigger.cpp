#include "CollisionManager.h"
#include "Player.h"
#include "Trigger.h"

namespace Amju
{
void CollidePlayerTrigger(Player* p, Trigger* tr)
{
  tr->OnPlayerCollision(p);
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Trigger::NAME, (CollisionManager::CollisionHandler)CollidePlayerTrigger);
} 
