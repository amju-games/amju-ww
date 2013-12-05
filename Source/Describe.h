#pragma once

#include <string>
#include <Vec3.h>

namespace Amju
{
class GameObject;

std::string Describe(const GameObject* go);

std::string Describe(const Vec3f& v);
}
