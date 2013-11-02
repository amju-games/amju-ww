#include "CollisionManager.h"
#include "Dino.h"
#include "Pet.h"

namespace Amju
{
void CollideDinoPet(GameObject* go1, GameObject* go2)
{
  Dino* dino = dynamic_cast<Dino*>(go1);
  Assert(dino);
  Pet* pet = dynamic_cast<Pet*>(go2);
  Assert(pet);

#ifdef COLLIDE_DEBUG
  std::cout << "***Pet/Dino collision\n";
#endif
  if (!dino->IsEating() && !pet->IsDead())
  {
    dino->Eat(pet);
  }
}

static bool b = TheCollisionManager::Instance()->Add(
  Dino::NAME, Pet::NAME, CollideDinoPet);
}
