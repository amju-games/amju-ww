#ifndef PREVENT_INTERSECTION_H_INCLUDED
#define PREVENT_INTERSECTION_H_INCLUDED

#include <GameObject.h>

namespace Amju
{
// Move moving object away from stationary object so they do not intersect.
// Relies on knowing the old (non-intersecting) position of the moving object.
void PreventIntersection(
  GameObject* moving, const GameObject* stationary, const Vec3f& oldPos);
}

#endif

