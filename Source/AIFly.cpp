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

void AIFly::Update()
{
  m_npc->SetAnim("fly");
}

}
