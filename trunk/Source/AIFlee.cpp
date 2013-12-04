#include "AIFlee.h"
#include "Npc.h"
#include "Floor.h"
#include "AIIdle.h"
#include <DegRad.h>

namespace Amju
{
const char* AIFlee::NAME = "ai-flee";

const char* AIFlee::GetName() const
{
  return NAME;
}

float AIFlee::GetRank()
{
  Assert(m_npc);

  return 0; // TODO
}

void AIFlee::Update()
{
  AI::Update();
  Assert(m_npc);
  if (!m_npc->GetFloor())
  {
    return;
  }

  Vec3f vel = m_npc->GetPos() - m_target->GetPos();
  vel.y = 0;
  if (vel.SqLen() > 10.0f)
  {
    vel.Normalise();
    static const float SPEED = 50.0f; // TODO CONFIG
    vel *= SPEED;
    Vec3f v = m_npc->GetVel();
    v.x = vel.x;
    v.z = vel.z;
    m_npc->SetVel(v);
    m_npc->SetDir(RadToDeg(atan2(vel.x, vel.z)));
    m_npc->SetIsControlled(true); 
    m_npc->SetAnim("walk");
  }
  else
  {
    std::cout << m_npc->GetTypeName() << " flee finished.\n";
    m_npc->SetAI(AIIdle::NAME);
  }
}
}
