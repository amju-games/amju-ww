#include "Npc.h"
#include "AmjuAssert.h"
#include "AIFalling.h"
#include "Describe.h"

//#define AI_DEBUG

namespace Amju
{
Npc::Npc()
{
  m_ai = 0;
}
  
AI* Npc::GetAI(const char* aiName)
{
  auto it = m_ais.find(aiName);
  Assert(it != m_ais.end());
  return it->second;
}

void Npc::DecideAI()
{
  typedef std::pair<float, AI*> RankAI;
  RankAI best(0.0f, (AI*)0);

  // Rank each behaviour, choose best
  for (AIs::iterator it = m_ais.begin(); it != m_ais.end(); ++it)
  {
    AI* ai = it->second;
    float rank = ai->GetRank();
#ifdef AI_DEBUG
    std::cout << Describe(this) << ": rank for " 
      << ai->GetName() << ": " << rank << "\n";   
#endif

    if (rank >= best.first)
    {
      best.first = rank;
      best.second = ai;
    }
  }
#ifdef AI_DEBUG
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
#ifdef AI_DEBUG
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

  if (IsDead())
  {
    return;
  }

  if (!IsOnFloor())
  {
    // Falling
    SetAI(AIFalling::NAME); 
  }

  if (m_ai)
  {
    m_ai->Update();
  }
}

void Npc::OnAnimFinished()
{
  if (m_ai)
  {
    m_ai->OnAnimFinished();
  }
}

void Npc::OnAnimFreeze()
{
  if (m_ai)
  {
    m_ai->OnAnimFreeze();
  }
}

void Npc::OnAnimRepeat()
{
  if (m_ai)
  {
    m_ai->OnAnimRepeat();
  }
}
}
