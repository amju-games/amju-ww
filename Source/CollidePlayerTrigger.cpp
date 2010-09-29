#include "CollisionManager.h"
#include "Player.h"
#include "TutorialTrigger.h"

namespace Amju
{
void CollidePlayerTutorialTrigger(Player* p, TutorialTrigger* tr)
{
  tr->OnPlayerCollision(p);
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, TutorialTrigger::NAME, 
  (CollisionManager::CollisionHandler)CollidePlayerTutorialTrigger);
} 
