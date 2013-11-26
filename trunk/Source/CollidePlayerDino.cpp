#include "CollisionManager.h"
#include "Player.h"
#include "Dino.h"
#include "PlayWav.h"
#include "AIStunned.h"

namespace Amju
{
void CollidePlayerDino(GameObject* go1, GameObject* go2)
{
  Player* player = dynamic_cast<Player*>(go1);
  Assert(player);
  Dino* dino = dynamic_cast<Dino*>(go2);
  Assert(dino);

  player->DropPets();

  Vec3f vel = player->GetVel();
  player->SetVel(-vel);

  vel = dino->GetVel();
  dino->SetVel(Vec3f(0, 0, 0));
  dino->SetAI(AIStunned::NAME);

/*
  // Sound effect
  // TODO Make sure not played more than once in successive frames
  // -- have a timer
  PlayWav("gasp"); // NB No file ext

  // Push both objects away from each other

  static const float RESPONSE = 100.0f; // TODO CONFIG

  // Line between centres
  Vec3f line = go1->GetPos() - go2->GetPos();
  line.y = 0;
  line.Normalise();
  line *= RESPONSE;

  Vec3f v1 = go1->GetVel() + line;
  v1.y = 0;
  go1->SetVel(v1);
  //go1->SetAcc(-v1);
  //go1->StopRotating();

  Vec3f v2 = go2->GetVel() - line;
  v2.y = 0;
  go2->SetVel(v2);
  //go2->SetAcc(-v2);
  //go2->StopRotating();
*/
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Dino::NAME, CollidePlayerDino, AMJU_EVERY_CONTACT);
} 
