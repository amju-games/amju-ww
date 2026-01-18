#include "CollisionManager.h"
#include "Player.h"

namespace Amju
{
void CollidePlayerPlayer(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect? E.g. 'oof!'

  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Player*>(go2));

  // Push players apart
  // TODO TEMP TEST
  Vec3f v1 = go1->GetVel();
  Vec3f v2 = go2->GetVel();
  go1->SetVel(v1 - v2);
  go2->SetVel(v2 - v1);
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Player::NAME, &CollidePlayerPlayer, AMJU_EVERY_CONTACT);
}
