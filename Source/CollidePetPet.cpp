#include <iostream>
#include "CollisionManager.h"
#include "Pet.h"
#include "PreventIntersection.h"

namespace Amju
{
static const float RADIUS = 15.0f; // extent of AABB in (x, z)

void CollidePetPet(GameObject* go1, GameObject* go2)
{
  // Push both objects away from each other
  Pet* pet1 = dynamic_cast<Pet*>(go1);
  Assert(pet1);
  Pet* pet2 = dynamic_cast<Pet*>(go2);
  Assert(pet2);

  if (pet1->GetCarryingPlayer() || pet2->GetCarryingPlayer())
  {
    return;
  }

/*
  PreventIntersection(pet1, pet2, pet1->GetOldPos());
  pet1->RecalcAABB();

  PreventIntersection(pet2, pet1, pet2->GetOldPos());
  pet2->RecalcAABB();

  return;
*/
//std::cout << "Push away  pet " << pet1->GetId() << " and pet " << pet2->GetId() << "\n";

  Vec3f vel = pet1->GetVel();
  vel.y = -vel.y; // so we always fall
  pet1->SetVel(-vel);

  vel = pet2->GetVel();
  vel.y = -vel.y; // so we always fall
  pet2->SetVel(-vel);

  // TODO Handle y axis
/*
  Vec3f pos1 = pet1->GetPos();
  Vec3f pos2 = pet2->GetPos();
  Vec3f v = pos1-pos2;
  v.Normalise();
  v *= RADIUS;
  pos1 += v;
  pos2 -= v;
  pet1->SetPos(pos1);
  pet2->SetPos(pos2);
*/

/*
*/
}

static bool b = TheCollisionManager::Instance()->Add(
  Pet::NAME, Pet::NAME, &CollidePetPet, AMJU_FIRST_CONTACT_ONLY);
} 
