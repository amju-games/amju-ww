#include <GameObject.h>
#include <StringUtils.h>
#include "Describe.h"

namespace Amju
{
std::string Describe(const GameObject* go)
{
  return std::string(go->GetTypeName()) + " ID: " + ToString(go->GetId());
}
}

