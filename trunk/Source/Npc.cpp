#include "Npc.h"
#include "AmjuAssert.h"

namespace Amju
{
Npc::Npc()
{
  m_ai = 0;
}

void Npc::DecideAI()
{
  typedef std::pair<float, AI*> RankAI;
  RankAI best(0, 0);

  // Rank each behaviour, choose best
  for (AIs::iterator it = m_ais.begin(); it != m_ais.end(); ++it)
  {
    float rank = it->second->GetRank();
    if (rank >= best.first)
    {
      best.first = rank;
      best.second = it->second;
    }
  }
#ifdef _DEBUG
  std::cout << GetTypeName() << " choosing AI: " << best.second->GetName() 
    << " rank: " << best.first << "\n";
#endif
  SetAI(best.second);
}

void Npc::AddAI(AI* ai)
{
  m_ais[ai->GetName()] = ai;
  ai->SetNpc(this);
}

void Npc::SetAI(AI* ai)
{
  if (m_ai == ai)
  {
    return;
  }

  if (m_ai)
  {
    m_ai->OnDeactivated();
  }
  m_ai = ai;
#ifdef _DEBUG
  std::cout << GetTypeName() << " changing AI to " << m_ai->GetName() << "\n";
#endif
  m_ai->OnActivated();
}

void Npc::SetAI(const char* aiName)
{
  Assert(m_ais.find(aiName) != m_ais.end());
  SetAI(m_ais[aiName]);
}

void Npc::Update()
{
  OnFloorCharacter::Update();
  if (m_ai)
  {
    m_ai->Update();
  }
}

void Npc::OnAnimFinished()
{
  m_ai->OnAnimFinished();
}

void Npc::OnAnimFreeze()
{
  m_ai->OnAnimFreeze();
}

void Npc::OnAnimRepeat()
{
  m_ai->OnAnimRepeat();
}

}
