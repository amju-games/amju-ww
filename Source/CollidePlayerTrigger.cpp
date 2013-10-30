#include "CollisionManager.h"
#include "Player.h"
#include "TutorialTrigger.h"

namespace Amju
{
void CollidePlayerTutorialTrigger(GameObject* go1, GameObject* go2)
{
  Player* p = dynamic_cast<Player*>(go1);
  Assert(p);
  TutorialTrigger* tr = dynamic_cast<TutorialTrigger*>(go2);
  Assert(tr);

  tr->OnPlayerCollision(p);
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, TutorialTrigger::NAME, CollidePlayerTutorialTrigger);
} 
