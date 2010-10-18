#include "CollisionManager.h"
#include "Dino.h"
#include "Pet.h"

namespace Amju
{
void CollideDinoPet(Dino* go1, Pet* go2)
{
#ifdef COLLIDE_DEBUG
  std::cout << "***Pet/Dino collision\n";
#endif
  if (!go1->IsEating())
  {
    go1->Eat(go2);
  }
}

static bool b = TheCollisionManager::Instance()->Add(
  Dino::NAME, Pet::NAME, (CollisionManager::CollisionHandler)&CollideDinoPet);
}
