#include <iostream>
#include <ROConfig.h>
#include "CollisionManager.h"
#include "Pet.h"
#include "PreventIntersection.h"
#include "Describe.h"

namespace Amju
{
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

std::cout << "Push away  pet " << pet1->GetId() << " and pet " << pet2->GetId() << "\n";

  // Radius of circle around pet. If circles overlap, move apart by 
  //  penetration depth.
  static const float RADIUS = ROConfig()->GetFloat("pet-collide-radius");

  Vec3f pos1 = pet1->GetPos();
  Vec3f pos2 = pet2->GetPos();
  Vec3f v = pos1 - pos2; // from pos2 to pos1
  v.y = 0; // ignore diff in y
  float len = sqrt(v.SqLen());
std::cout << "Position diff: " << len << "\n";
  if (len < 2 * RADIUS)
  {
    // Get penetration dist
    float diff = (RADIUS * 2 - len) * 0.5f;
    v *= diff / len;
std::cout << "Moving pets apart: " << Describe(v) << "\n";

    pos1 += v;
    pos2 -= v;
    pet1->SetPos(pos1);
    pet2->SetPos(pos2);
  }
}

static bool b = TheCollisionManager::Instance()->Add(
  Pet::NAME, Pet::NAME, &CollidePetPet, AMJU_FIRST_CONTACT_ONLY);
} 
