#include <DegRad.h>
#include "AITurnToFace.h"
#include "AIEatPet.h"
#include "Npc.h"
#include "Describe.h"
#include "Dino.h"
#include "Pet.h"

namespace Amju
{  
const char* AITurnToFace::NAME = "turn to face pet";

AITurnToFace::AITurnToFace()
{
  // Low rank for Decide(), but is set directly if we collide with a pet
  m_rank = -10;
}

void AITurnToFace::Update()
{
  AI::Update();

#ifdef AI_DEBUG
  std::cout << "Dino turning to face pet!\n";
#endif

  Vec3f v = m_npc->GetPos() - m_target->GetPos();
  float degs = RadToDeg(atan2(-v.x, -v.z)); // TODO ??

  m_npc->SetDir(degs);

  float angleDiff = degs - m_npc->GetDir();
  
std::cout << "AI turn to face: target is " << Describe(m_target) << " heading: " << degs << "degs, currently: " << m_npc->GetDir() << "\n";

  if (fabs(angleDiff) < 10.0f)
  {
    std::cout << "OK, now we will eat pet!\n";
    ((Pet*)m_target)->StartBeingEaten((Dino*)m_npc);
    m_npc->SetAI(AIEatPet::NAME);
  }
}

const char* AITurnToFace::GetName() const
{
  return NAME;
}

}
