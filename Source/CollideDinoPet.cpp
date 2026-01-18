#include "CollisionManager.h"
#include "Dino.h"
#include "Pet.h"
#include "AIFlee.h"

namespace Amju
{
void CollideDinoPet(GameObject* go1, GameObject* go2)
{
  Dino* dino = dynamic_cast<Dino*>(go1);
  Assert(dino);
  OnFloorCharacter* pet = dynamic_cast<OnFloorCharacter*>(go2);
  Assert(pet);

#ifdef COLLIDE_DEBUG
  std::cout << "***Pet/Dino collision\n";
#endif
  if (!dino->IsEating() && 
      !dino->IsDead() &&
      pet->CanBeEaten() && 
      !dino->IsFalling() 
     )
  {
    dino->Eat(pet);
  }
/*
  else
  {
    AI* ai = pet->GetAI(AIFlee::NAME);
    ai->SetTarget(dino);
    pet->SetAI(ai);
  }
*/
}

static bool b = TheCollisionManager::Instance()->Add(
  Dino::NAME, Pet::NAME, CollideDinoPet, AMJU_EVERY_CONTACT);
}
