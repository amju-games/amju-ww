#include <iostream>
#include "AIStunned.h"
#include "Npc.h"

namespace Amju
{
const char* AIStunned::NAME = "ai-stunned";

AIStunned::AIStunned()
{
}

void AIStunned::OnActivated() 
{
  AI::OnActivated();

  Assert(m_npc);
  m_npc->SetAnim("stunned");
}

void AIStunned::Update() 
{
  AI::Update();
  if (m_time > 5.0f) // TODO 
  {
    std::cout << "Stunned dino has recovered!\n";
    Assert(m_npc);
    m_npc->DecideAI();
  }
}

const char* AIStunned::GetName() const 
{
  return NAME;
}
}

