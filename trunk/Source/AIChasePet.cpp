#include <Game.h>
#include <DegRad.h>
#include <ROConfig.h>
#include "Pet.h"
#include "AIChasePet.h"
#include "AIIdle.h"

namespace Amju
{
const char* AIChasePet::NAME = "ai-chase-pet";

const char* AIChasePet::GetName() const
{
  return NAME;
}

void AIChasePet::Update()
{
  AI::Update();
  Assert(m_npc);
  // Head towards pet
  Vec3f aim = m_target->GetPos();
  Vec3f vel = aim - m_npc->GetPos();
  vel.y = 0;

  static const float MAX_DIST = ROConfig()->GetFloat("dino-chase-dist"); 
  static const float MAX_DIST_SQ = MAX_DIST * MAX_DIST;

  float sqlen = vel.SqLen();
  if (sqlen < MAX_DIST_SQ && sqlen > 1.0f) // TODO but needs to be > 0!!
  {
    vel.Normalise();

    static const float SPEED = ROConfig()->GetFloat("dino-chase-speed"); 
    vel *= SPEED;
    Vec3f v = m_npc->GetVel();
    v.x = vel.x;
    v.z = vel.z;
    m_npc->SetVel(v);
    float degs = RadToDeg(atan2(vel.x, vel.z)); 

    m_npc->SetDir(degs);
    m_npc->SetIsControlled(true); 
    m_npc->SetAnim("run");
  }
  else
  {
#ifdef _DEBUG
    std::cout << m_npc->GetTypeName() << " giving up chase\n";
#endif
    m_npc->SetAI(AIIdle::NAME);
  }
}

float AIChasePet::GetRank()
{
  // Find pets, get dist to each one
  float rank = -500.0f;
  float bestDist = 99999.9f;
  Characters pets;
  GetCharacters(&pets);
  for (unsigned int i = 0; i < pets.size(); i++)
  {
    OnFloorCharacter* pet = pets[i];
    float distSq = (m_npc->GetPos() - pet->GetPos()).SqLen();

    static const float MAX_DIST = ROConfig()->GetFloat("dino-chase-dist"); 
    static const float MAX_DIST_SQ = MAX_DIST * MAX_DIST;

    if (distSq < bestDist && distSq < MAX_DIST_SQ)
    {
      bestDist = distSq;
      m_target = pet;
      rank = 500.0f; // ????
    }
  }
  return rank;
}
}

