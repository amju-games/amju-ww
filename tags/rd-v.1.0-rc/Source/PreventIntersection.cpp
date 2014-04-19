#include <iostream>
#include "PreventIntersection.h"
#include "Describe.h"

namespace Amju
{
// Move moving object away from stationary object so they do not intersect.
// Relies on knowing the old (non-intersecting) position of the moving object.
void PreventIntersection(
  GameObject* moving, const GameObject* stationary, const Vec3f& oldPos)
{
std::cout << "Moving apart: moving: " << Describe(moving) << " stnry: " << Describe(stationary) << ": ";

  /* 
  Move back so not interpenetrating:
  Boxes now intersect in all axes. Moving away by penetration depth in any
  axis will resolve the intersection. To choose which axis, use the previous
  position. E.g. if previously not intersecting in X, move away in X axis.
  */

  // Intersecton region
  AABB ir = stationary->GetAABB().Intersection(moving->GetAABB());
  Vec3f goPos = moving->GetPos();

  // Create AABB in old position
  AABB oldBox = moving->GetAABB();
  Vec3f move = oldPos - goPos;
  oldBox.Translate(move);
  // Oldbox should not be intersecting in one or more axes

  const AABB& stationaryBox = stationary->GetAABB();

  // Penetration depth in each axis
  Vec3f penDist(
    ir.GetMax(0) - ir.GetMin(0), 
    ir.GetMax(1) - ir.GetMin(1),
    ir.GetMax(2) - ir.GetMin(2));
  penDist *= 1.01f; // move away a bit more to be sure of clearing the collision

std::cout << "Pen depths: " << Describe(penDist) << ": ";

  //Vec3f vel = moving->GetVel();

  if (oldBox.GetMax(0) < stationaryBox.GetMin(0))
  {
    // Old box to left of stationary object, so move away to the left
//    Assert(penDist.x > 0);
    goPos.x -= penDist.x; 

std::cout << "x -= " << penDist.x;
  }
  else if (oldBox.GetMin(0) > stationaryBox.GetMax(0))
  {
//    Assert(penDist.x > 0);
    goPos.x += penDist.x;

std::cout << "x += " << penDist.x;
  }
  if (oldBox.GetMax(1) < stationaryBox.GetMin(1))
  {
//    Assert(penDist.y > 0);
    goPos.y -= penDist.y;
std::cout << "y -= " << penDist.y;
  }
  else if (oldBox.GetMin(1) > stationaryBox.GetMax(1))
  {
//    Assert(penDist.y > 0);
    goPos.y += penDist.y;
std::cout << "y += " << penDist.y;
  }
  if (oldBox.GetMax(2) < stationaryBox.GetMin(2))
  {
//    Assert(penDist.z > 0);
    goPos.z -= penDist.z;
std::cout << "z -= " << penDist.z;
  }
  else if (oldBox.GetMin(2) > stationaryBox.GetMax(2))
  {
//    Assert(penDist.z > 0);
    goPos.z += penDist.z;
std::cout << "z += " << penDist.z;
  }

std::cout << "\n";

  moving->SetPos(goPos);


//  moving->RecalcAABB();
  // Test that AABBs are no longer intersecting
//  if (stationary->GetAABB().Intersects(moving->GetAABB()))
//  {
//    AABB ir = stationary->GetAABB().Intersection(moving->GetAABB());
//  }
}

}
