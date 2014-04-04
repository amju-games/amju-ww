#include <DegRad.h>
#include "AIEatPet.h"
#include "AIFlee.h"
#include "Dino.h"
#include "Pet.h"
#include "PlayWav.h"

//#define AI_DEBUG

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

  /*
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
  */
}

void AIEatPet::Update()
{
  AI::Update();

#ifdef AI_DEBUG
  std::cout << "Dino eating pet!\n";
#endif

  //m_npc->SetAnim("eat");
  // Done in collision handler function
 
  // Stop target moving in x,z but allow to fall if already falling
  Vec3f vel = m_target->GetVel();
  vel.x = 0;
  vel.z = 0; 
  m_target->SetVel(vel);

  m_npc->SetVel(Vec3f(0, 0, 0)); // Stop this dino moving
}

void AIEatPet::OnAnimFinished()
{
  m_npc->DecideAI();
  PlayWav("burp");
}

}
