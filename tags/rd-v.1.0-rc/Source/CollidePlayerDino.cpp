#include "CollisionManager.h"
#include "Player.h"
#include "Dino.h"
#include "PlayWav.h"
#include "AIStunned.h"
#include "Pet.h"
#include "AIFlee.h"
#include "Camera.h"
#include "Camera.h"

namespace Amju
{
void CollidePlayerDino(GameObject* go1, GameObject* go2)
{
  Player* player = dynamic_cast<Player*>(go1);
  Assert(player);
  Dino* dino = dynamic_cast<Dino*>(go2);
  Assert(dino);

  if (dino->IsDead())
  {
    return; // this actually happened!
  }

  // Get the pets to flee the dino
  PetList pets = player->GetPets();
  player->DropPets();
  for (PetList::iterator it = pets.begin(); it != pets.end(); ++it)
  {
    Pet* pet = *it;
    AI* ai = pet->GetAI(AIFlee::NAME);
    ai->SetTarget(dino);
    pet->SetAI(ai);
    pet->SetIsFalling(true);
  }

  Vec3f vel = player->GetVel();
  player->SetVel(-vel);

  vel = dino->GetVel();
  dino->SetVel(Vec3f(0, 0, 0));
  dino->SetAI(AIStunned::NAME);

  PlayWav("hammer_anvil3"); // NB No file ext
  Camera* cam = GetActiveCamera();
  Assert(cam);
  cam->SetEarthquake(1.0f); // TODO CONFIG
}

// Trying a different design, Dinos can eat Player
//static bool b = TheCollisionManager::Instance()->Add(
//  Player::NAME, Dino::NAME, CollidePlayerDino, AMJU_FIRST_CONTACT_ONLY);
} 
