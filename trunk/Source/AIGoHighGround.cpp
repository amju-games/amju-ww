#include "AIGoHighGround.h"
#include "Npc.h"
#include "Floor.h"
#include "AIIdle.h"
#include <DegRad.h>

namespace Amju
{
const char* AIGoHighGround::NAME = "aigohighground";

const char* AIGoHighGround::GetName() const
{
  return NAME;
}

float AIGoHighGround::GetRank()
{
  Assert(m_npc);

  if (!m_npc->GetFloor())
  {
    // Not on a floor - falling ?
    return -1000;
  }

  Vec3f aim = m_npc->GetFloor()->GetHighPoint();
  Vec3f vel = aim - m_npc->GetPos();
  float rank = sqrt((aim - vel).SqLen());
  return rank;
}

void AIGoHighGround::Update()
{
  AI::Update();
  Assert(m_npc);
  if (!m_npc->GetFloor())
  {
    // Falling ?
    // ??? m_npc->DecideAI();
    m_npc->SetAI(AIIdle::NAME); // ??
    return;
  }

  Vec3f aim = m_npc->GetFloor()->GetHighPoint();
  Vec3f vel = aim - m_npc->GetPos();
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
  }
  else
  {
#ifdef _DEBUG
    std::cout << m_npc->GetTypeName() << " reached high ground\n";
#endif
    m_npc->SetAI(AIIdle::NAME);
  }
}
}
