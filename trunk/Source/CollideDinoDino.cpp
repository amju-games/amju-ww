#include "CollisionManager.h"
#include "Dino.h"
#include "PlayWav.h"

namespace Amju
{
void CollideDinoDino(GameObject* go1, GameObject* go2)
{
  // Sound effect
  // TODO Make sure not played more than once in successive frames
  // -- have a timer
  PlayWav("gasp"); // NB No file ext

  // Push both objects away from each other

  static const float RESPONSE = 5.0f; // TODO CONFIG

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
  Dino::NAME, Dino::NAME, &CollideDinoDino);
} 
