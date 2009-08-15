#include "CollisionManager.h"
#include "Player.h"
#include "Dino.h"

namespace Amju
{
void CollidePlayerDino(GameObject* go1, GameObject* go2)
{
  // TODO Sound effect

  // Collision like pool balls. We work out the total velocity of both
  // objects, projected onto the line connecting their centres.
  // Each object gets this vector added to their velocity.
  // We may want to damp this a bit.
  static const float DAMP = 0.5f; // TODO CONFIG

  // Line between centres
  Vec3f line = go1->GetPos() - go2->GetPos();
  Vec3f totalVel = go1->GetVel() - go2->GetVel();
  // go1 gets new vel = go1->vel + totalVel projected onto line
  float invSqLen = 1.0f / line.SqLen();
  Vec3f proj = line * (DotProduct(totalVel, line) * invSqLen) * DAMP;
  //  = totalVel projected onto line 
  go1->SetVel(go1->GetVel() - proj);
  go2->SetVel(go2->GetVel() + proj);
}

static bool b = TheCollisionManager::Instance()->Add(
  Player::NAME, Dino::NAME, &CollidePlayerDino);
} 
