#include "CollisionManager.h"
#include "Player.h"
#include "Deadly.h"
#include "PlayWav.h"
#include "Camera.h"

namespace Amju
{
void CollidePlayerDeadly(GameObject* go1, GameObject* go2)
{
  Player* player = dynamic_cast<Player*>(go1);
  Assert(player);
  Deadly* d = dynamic_cast<Deadly*>(go2);
  Assert(d);

  PlayWav("hammer_anvil3"); // NB No file ext
  Camera* cam = GetActiveCamera();
  Assert(cam);
  cam->SetEarthquake(1.0f); // TODO CONFIG
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Deadly::NAME, CollidePlayerDeadly, AMJU_FIRST_CONTACT_ONLY);
} 
