#include "AI.h"
#include <Timer.h>

namespace Amju
{
AI::AI()
{
  m_npc = 0;
  m_target = 0;
  m_time = 0;
  m_rank = 0;
}

void AI::SetNpc(Npc* npc)
{
  m_npc = npc;
  Assert((GameObject*)m_npc != m_target); // why the same?
}

void AI::SetTarget(GameObject* target)
{
  m_target = target;
  Assert((GameObject*)m_npc != m_target); // why the same?
}

void AI::Update()
{
  m_time += TheTimer::Instance()->GetDt();
}

void AI::OnActivated()
{
  m_time = 0;
}

float AI::GetRank()
{
  return m_rank;
}
}
