#include "EditModeCamera.h"

namespace Amju
{
void EditModeCamera::Update()
{
  // TODO TEMP TEST
  SetEyePos(Vec3f(0, 0, 0));
  SetLookAtPos(Vec3f(0, 0, 1));
  SetUpVec(Vec3f(0, 1, 0));
}
}

