#include "CollisionManager.h"
#include "Player.h"
#include "Dino.h"
#include "SoundManager.h"

namespace Amju
{
void CollidePlayerDino(GameObject* go1, GameObject* go2)
{
  // Sound effect
  // TODO Make sure not played more than once in successive frames
  // -- have a timer
  TheSoundManager::Instance()->PlayWav("gasp"); // NB No file ext

  // Push both objects away from each other

  static const float RESPONSE = 10.0f; // TODO CONFIG

  // Line between centres
  Vec3f line = go1->GetPos() - go2->GetPos();
  line.Normalise();
  line *= RESPONSE;

  go1->SetVel(go1->GetVel() + line);
  go1->SetAcc(-go1->GetVel());

  go2->SetVel(go2->GetVel() - line);
  go2->SetAcc(-go2->GetVel());
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Dino::NAME, &CollidePlayerDino);
} 
