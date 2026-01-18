#include "CollisionManager.h"
#include "Player.h"
#include "Dino.h"
#include "Fence.h"
#include "Rect.h"
#include "Pet.h"
#include "OnFloor.h"

namespace Amju
{
void CollideObjectFence(GameObject* go1, GameObject* go2)
{
  Assert(dynamic_cast<OnFloor*>(go1));
  Assert(dynamic_cast<Fence*>(go2));

  OnFloor* go = (OnFloor*)go1;
  Fence* fence = (Fence*)go2;

  /* 
  Move back so not interpenetrating:
  Boxes now intersect in all axes. Moving away by penetration depth in any
  axis will resolve the intersection. To choose which axis, use the previous
  position. E.g. if previously not intersecting in X, move away in X axis.
  */

  // Intersecton region
  AABB ir = fence->GetAABB()->Intersection(*(go->GetAABB()));
  Vec3f goPos = go->GetPos();
  const Vec3f& oldPos = go->GetOldPos();

  AABB oldBox = *(go->GetAABB());
  Vec3f move = oldPos - goPos;
  oldBox.Translate(move);
  // Oldbox should not be intersecting in one or more axes

  const AABB& fenceBox = *(fence->GetAABB());

  Vec3f penDist(
    ir.GetMax(0) - ir.GetMin(0), 
    ir.GetMax(1) - ir.GetMin(1),
    ir.GetMax(2) - ir.GetMin(2));
  penDist *= 1.01f; // move away a bit more to be sure of clearing the collision

  if (oldBox.GetMax(0) < fenceBox.GetMin(0))
  {
    // Old box to left of fence, so move away to the left
    goPos.x -= penDist.x; 
  }
  else if (oldBox.GetMin(0) > fenceBox.GetMax(0))
  {
    goPos.x += penDist.x;
  }
  else if (oldBox.GetMax(1) < fenceBox.GetMin(1))
  {
    goPos.y -= penDist.y;
  }
  else if (oldBox.GetMin(1) > fenceBox.GetMax(1))
  {
    goPos.y += penDist.y;
  }
  else if (oldBox.GetMax(2) < fenceBox.GetMin(2))
  {
    goPos.z -= penDist.z;
  }
  else if (oldBox.GetMin(2) > fenceBox.GetMax(2))
  {
    goPos.z += penDist.z;
  }

  go->SetPos(goPos);
}

static bool b[] = 
{
  TheCollisionManager::Instance()->Add(
    Player::NAME, Fence::NAME, &CollideObjectFence),

  TheCollisionManager::Instance()->Add(
    Dino::NAME, Fence::NAME, &CollideObjectFence),

  TheCollisionManager::Instance()->Add(
    Pet::NAME, Fence::NAME, &CollideObjectFence)

  // TODO others, e.g. blocks
};
}
