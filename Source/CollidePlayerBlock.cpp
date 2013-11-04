#include "CollisionManager.h"
#include "Player.h"
#include "Block.h"

namespace Amju
{
void CollidePlayerBlock(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect? E.g. 'oof!'

  // Blocks push the player around - so apply the block's velocity to the player ?
  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Block*>(go2));

  go1->SetVel(go1->GetVel() + go2->GetVel());
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Block::NAME, &CollidePlayerBlock, AMJU_FIRST_CONTACT_ONLY);
}
