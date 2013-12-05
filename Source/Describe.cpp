#include <GameObject.h>
#include <StringUtils.h>
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
}

