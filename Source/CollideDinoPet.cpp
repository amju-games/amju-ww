#include "CollisionManager.h"
#include "Dino.h"
#include "Pet.h"

namespace Amju
{
void CollideDinoPet(GameObject* go1, GameObject* go2)
{
  Assert(dynamic_cast<Dino*>(go1));
  Assert(dynamic_cast<Pet*>(go2));

#ifdef _DEBUG
  std::cout << "***Pet/Dino collision\n";
#endif
  ((Dino*)go1)->Eat((Pet*)go2);
}

static bool b = TheCollisionManager::Instance()->Add(
  Dino::NAME, Pet::NAME, &CollideDinoPet);
}
