#include "CollisionManager.h"
#include "Player.h"
#include "Pet.h"

namespace Amju
{
void CollidePlayerPet(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect? E.g. 'oof!'

  Assert(dynamic_cast<Player*>(go1));
  Assert(dynamic_cast<Pet*>(go2));

  // This pet disappears, add to player score
  ((Pet*)go2)->SetDead(true);
  // TODO Sound
  // TODO Particle effect etc
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Pet::NAME, &CollidePlayerPet);
}
