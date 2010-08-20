#include "AIEatPet.h"
#include "Npc.h"
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

#ifdef _DEBUG
  std::cout << "Dino eating pet!\n";
#endif

  Vec3f v = m_npc->GetPos() - m_target->GetPos();
  float degs = RadToDeg(atan2(-v.x, v.z)); // TODO ??
  m_npc->SetDir(degs);

  // TODO Wait till we are facing

  m_npc->SetAnim("eat");
  // TODO Eaten anim for pet, make dead after delay
  m_target->SetVel(Vec3f(0, 0, 0)); // Stop pet moving
  
  if (m_time > 0.25f) // TODO CONFIG
  {
    ((Pet*)m_target)->SetDead(true);
  }
  if (m_time > 4.0f) // TODO CONFIG
  {
    m_npc->DecideAI();
  }
}
}