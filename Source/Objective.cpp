#include "Objective.h"
#include "Game.h"
#include "Dino.h"
#include "Exit.h"
#include "GSLevelComplete.h"
#include "GameObjectFactory.h"

namespace Amju
{
GameObject* CreateObjective() { return new Objective; }
static bool reg = TheGameObjectFactory::Instance()->Add(Objective::NAME, &CreateObjective);

const char* Objective::NAME = "objective";

Objective::Objective()
{
  m_isComplete = false;
}

const char* Objective::GetTypeName() const
{
  return NAME;
}

void Objective::ObjectiveComplete()
{
  // Actvate all Exits in the level
  Game::GameObjects* pGos = TheGame::Instance()->GetGameObjects();
  for (Game::GameObjects::iterator it = pGos->begin(); it != pGos->end(); ++it)
  {
    PGameObject p = it->second;
    Exit* e = dynamic_cast<Exit*>(p.GetPtr());
    if (e)
    {
      e->SetActive();
    }
  }
}

bool Objective::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }
  return true;
}

void Objective::Draw()
{
  // TODO Debug draw ?
}

void Objective::Update()
{
  if (m_isComplete)
  {
    return;
  }

  // Check dinos - if all are dead, objective is complete
  Game::GameObjects* pGos = TheGame::Instance()->GetGameObjects();
  for (Game::GameObjects::iterator it = pGos->begin(); it != pGos->end(); ++it)
  {
    PGameObject p = it->second;
    Dino* d = dynamic_cast<Dino*>(p.GetPtr());
    if (d && !d->IsDead())
    {
      return;
    }
  }
  // All dinos are dead
  ObjectiveComplete();
  m_isComplete = true;
}

void Objective::Reset()
{
  m_isComplete = false;
}
}
