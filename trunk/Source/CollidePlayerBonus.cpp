#include "CollisionManager.h"
#include "Player.h"
#include "Bonus.h"

namespace Amju
{
void CollidePlayerBonus(GameObject* go1, GameObject* go2)
{
  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Bonus*>(go2));

  ((Bonus*)go2)->OnPlayerCollision((Player*)go1);

  // TODO Player animation ?
}

#ifdef GLOBAL_INIT
static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Bonus::NAME, &CollidePlayerBonus, AMJU_FIRST_CONTACT_ONLY);
#endif
}
