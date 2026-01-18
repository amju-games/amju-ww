#include <AmjuAssert.h>
#include <Timer.h>
#include <ROConfig.h>
#include "Depth.h"

namespace Amju
{
static float s_depth = 0;
static float s_scrollSpeed = 1.0f;

float GetScrollSpeed()
{
  return s_scrollSpeed;
}

void SetScrollSpeed(float ss)
{
  Assert(ss >= 0); // negative would mean scroll up - not allowed, right??
  s_scrollSpeed = ss;
}

void ResetDepth()
{
  s_depth = 0;
  s_scrollSpeed = ROConfig()->GetFloat("scroll-speed");
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

void DepthUpdate(float minDepth)
{
  // New game design: camera always moves down

  float dt = TheTimer::Instance()->GetDt();

  float d = dt * s_scrollSpeed;

  IncreaseDepth(d);

  if (minDepth > s_depth)
  {
    s_depth = minDepth;
  }
}
}
