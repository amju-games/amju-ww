#include "CollisionManager.h"
#include "Player.h"
#include "TutorialTrigger.h"
#include "Portal.h"

namespace Amju
{
void CollidePlayerTrigger(GameObject* go1, GameObject* go2)
{
  Player* p = dynamic_cast<Player*>(go1);
  Assert(p);
  Trigger* tr = dynamic_cast<Trigger*>(go2);
  Assert(tr);

  tr->OnPlayerCollision(p);
}

static bool b[] = 
{
  TheCollisionManager::Instance()->Add(
    Player::NAME, TutorialTrigger::NAME, CollidePlayerTrigger, AMJU_FIRST_CONTACT_ONLY),

  TheCollisionManager::Instance()->Add(
    Player::NAME, Portal::NAME, CollidePlayerTrigger, AMJU_FIRST_CONTACT_ONLY)
};

} 
