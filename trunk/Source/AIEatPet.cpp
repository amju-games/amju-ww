#include "AIEatPet.h"
#include "Dino.h"
#include "Pet.h"
#include <DegRad.h>

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
}

}
