#include "CollisionManager.h"
#include "Player.h"
#include "Bonus.h"

namespace Amju
{
void CollidePlayerBonus(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect & expl. effect

  // Blocks push the player around - so apply the block's velocity to the player ?
  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Bonus*>(go2));

  ((Bonus*)go2)->OnPlayerCollision();

  // TODO Player animation ?
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Bonus::NAME, &CollidePlayerBonus);
}
