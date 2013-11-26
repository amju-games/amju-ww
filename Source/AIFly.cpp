#include <DegRad.h>
#include "AIFly.h"
#include "Npc.h"

namespace Amju
{
const char* AIFly::NAME = "ai-fly";

AIFly::AIFly()
{
}

const char* AIFly::GetName() const
{
  return NAME;
}

void AIFly::OnActivated()
{
  AI::OnActivated(); 
}

void AIFly::Update()
{
  Assert(m_npc);
  Assert(m_target);

  m_npc->SetAnim("fly"); // why not just in OnActivated?? TODO

  Vec3f a = (m_target->GetPos() + Vec3f(0, 40.0f, 0)) - m_npc->GetPos();
  a.Normalise();
  a *= 50.0f; // TODO CONFIG
  m_npc->SetAcc(a);

  a = m_npc->GetVel();
  if (a.SqLen() > 1.0f) // TODO
  {
    float degs = RadToDeg(atan2(a.x, a.z)); 
    // TODO normalise degs?
    m_npc->SetDir(degs);
  }
}

}
