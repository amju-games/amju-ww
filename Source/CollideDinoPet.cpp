#include "CollisionManager.h"
#include "Dino.h"
#include "Pet.h"
#include "Player.h"
#include "AIFlee.h"

//#define COLLIDE_DEBUG

namespace Amju
{
void CollideDinoPet(GameObject* go1, GameObject* go2)
{
  Dino* dino = dynamic_cast<Dino*>(go1);
  Assert(dino);
  OnFloorCharacter* ch = dynamic_cast<OnFloorCharacter*>(go2);
  Assert(ch);

#ifdef COLLIDE_DEBUG
  std::cout << "*** Dino/character collision: " <<
    " dino eating: " << dino->IsEating() << 
    " dino dead: " << dino->IsDead() <<
    " ch can be eaten: " << ch->CanBeEaten() <<
    " Dino falling: " << dino->IsFalling() <<
    " ch falling: " << ch->IsFalling() <<
    "\n";
#endif

  if (!dino->IsEating() && 
      !dino->IsDead() &&
      ch->CanBeEaten() && 
      !dino->IsFalling() &&
      !ch->IsFalling()
     )
  {
    dino->Eat(ch);
  }
}

#ifdef GLOBAL_INIT
static bool b = TheCollisionManager::Instance()->Add(
  Dino::NAME, Pet::NAME, CollideDinoPet, AMJU_EVERY_CONTACT);

static bool b2 = TheCollisionManager::Instance()->Add(
  Dino::NAME, Player::NAME, CollideDinoPet, AMJU_EVERY_CONTACT);
#endif

}
