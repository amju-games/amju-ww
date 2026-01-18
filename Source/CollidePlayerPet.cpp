#include "CollisionManager.h"
#include "Player.h"
#include "Pet.h"

namespace Amju
{
void CollidePlayerPet(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect? 

  Player* player = dynamic_cast<Player*>(go1);
  Pet* pet = dynamic_cast<Pet*>(go2);

  // Balance on top of player's stack of pets
  player->PickUpPet(pet);

  // This pet disappears, add to player score
//  ((Pet*)go2)->SetDead(true);
  // TODO Sound
  // TODO Particle effect etc
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Pet::NAME, &CollidePlayerPet);
}
