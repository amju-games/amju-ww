#include <DegRad.h>
#include "AIEatPet.h"
#include "AIFlee.h"
#include "Dino.h"
#include "Pet.h"
#include "PlayWav.h"

namespace Amju
{
const char* AIEatPet::NAME = "aieatpet";

AIEatPet::AIEatPet()
{
  // Low rank for Decide(), but is set directly if we collide with a pet
  m_rank = -10;
}

const char* AIEatPet::GetName() const
{
  return NAME;
}
  
void AIEatPet::OnActivated() 
{
  AI::OnActivated();

  // All pets within range flee
  Pets pets;
  GetPets(&pets);
  for (Pets::iterator it = pets.begin(); it != pets.end(); ++it)
  {
    Pet* pet = *it;
    if (!pet->IsDead())
    {
      // TODO And within range
      AI* flee = pet->GetAI(AIFlee::NAME);
      flee->SetTarget(m_npc);
      pet->SetAI(flee);
    }
  }
}

void AIEatPet::Update()
{
  AI::Update();

#ifdef AI_DEBUG
  std::cout << "Dino eating pet!\n";
#endif

  m_npc->SetAnim("eat");
  // TODO Eaten anim for pet, make dead after delay
  m_target->SetVel(Vec3f(0, 0, 0)); // Stop pet moving
  m_npc->SetVel(Vec3f(0, 0, 0)); // Stop this dino moving
}

void AIEatPet::OnAnimFinished()
{
  m_npc->DecideAI();
  PlayWav("burp");
}

}
