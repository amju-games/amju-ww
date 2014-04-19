#include <GameObject.h>
#include <StringUtils.h>
#include <Quaternion.h>
#include <DegRad.h>
#include "Describe.h"

namespace Amju
{
std::string Describe(const GameObject* go)
{
  return std::string(go->GetTypeName()) + " ID: " + ToString(go->GetId());
}

std::string Describe(const Vec3f& v)
{
  return "(" + ToString(v.x, 2) + ", " + ToString(v.y, 2) + ", " + ToString(v.z, 2) + ")";
}

std::string Describe(const Matrix& mat)
{
  Quaternion q;
  q.CreateFromMatrix(mat);
  float rads = 0;
  Vec3f axis;
  q.GetAxisAngle(&rads, &axis);
  return ToString(RadToDeg(rads), 2) + " degs around " + Describe(axis);
}

}

