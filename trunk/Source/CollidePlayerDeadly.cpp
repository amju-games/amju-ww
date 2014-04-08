#include "CollisionManager.h"
#include "Player.h"
#include "Deadly.h"

namespace Amju
{
void CollideObjectFloor(GameObject* go1, GameObject* go2);

void CollidePlayerDeadly(GameObject* go1, GameObject* go2)
{
  Player* player = dynamic_cast<Player*>(go1);
  Assert(player);
  Deadly* d = dynamic_cast<Deadly*>(go2);
  Assert(d);

  player->StartBeingDead();
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Deadly::NAME, CollidePlayerDeadly, AMJU_FIRST_CONTACT_ONLY);
} 
