#include <AmjuAssert.h>
#include <Timer.h>
#include "Depth.h"

namespace Amju
{
static float s_depth = 0;

void ResetDepth()
{
  s_depth = 0;
}

float GetCurrentDepth()
{
  return s_depth;
}

void IncreaseDepth(float depth)
{
  Assert(depth >= 0); // ?
  s_depth += depth;
}

void DepthUpdate()
{
  // New game design: camera always moves down
  float scrollSpeed = 50.0f; // TODO speed up ?

  float dt = TheTimer::Instance()->GetDt();

  float d = dt * scrollSpeed;

  IncreaseDepth(d);
}
}
