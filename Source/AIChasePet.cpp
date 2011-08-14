#include "AIChasePet.h"
#include <Game.h>
#include "Pet.h"
#include <DegRad.h>
#include "AIIdle.h"

namespace Amju
{
static const float MAX_DIST = 200.0f; // ??
static const float MAX_DIST_SQ = MAX_DIST * MAX_DIST;

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
  if (vel.SqLen() < MAX_DIST_SQ) 
  {
    vel.Normalise();
    static const float SPEED = 100.0f; // TODO CONFIG
    vel *= SPEED;
    Vec3f v = m_npc->GetVel();
    v.x = vel.x;
    v.z = vel.z;
    m_npc->SetVel(v);
    m_npc->SetDir(RadToDeg(atan2(vel.x, vel.z)));
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

typedef std::vector<Pet*> Pets;
void GetPets(Pets* pets)
{
  GameObjects* objs = TheGame::Instance()->GetGameObjects();
  for (GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
  {
    GameObject* go = it->second;
    Pet* p = dynamic_cast<Pet*>(go);
    if (p && !p->IsDead())
    {
      pets->push_back(p);
    }
  }
}

float AIChasePet::GetRank()
{
  // Find pets, get dist to each one
  float rank = -500.0f;
  float bestDist = 99999.9f;
  Pets pets;
  GetPets(&pets);
  for (unsigned int i = 0; i < pets.size(); i++)
  {
    Pet* pet = pets[i];
    float distSq = (m_npc->GetPos() - pet->GetPos()).SqLen();
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

