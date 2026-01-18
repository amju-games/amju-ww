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

  static const float MAX_SCROLL_SPEED = ROConfig()->GetFloat("max-scroll-speed");
  if (s_scrollSpeed > MAX_SCROLL_SPEED)
  {
    s_scrollSpeed = MAX_SCROLL_SPEED;
  }
}

void ResetDepth()
{
  static const float START_DEPTH = ROConfig()->GetFloat("start-depth");
  s_depth = START_DEPTH;
  s_scrollSpeed = ROConfig()->GetFloat("start-scroll-speed");
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

  static float depthAtThisSpeed = 0;
  depthAtThisSpeed += d;
  static const float DEPTH_FOR_SPEED_CHANGE = ROConfig()->GetFloat("depth-for-speed-change");
  if (depthAtThisSpeed >= DEPTH_FOR_SPEED_CHANGE)
  {
    depthAtThisSpeed = 0;
    static const float SCROLL_SPEED_INC = ROConfig()->GetFloat("scroll-speed-inc");
    SetScrollSpeed(s_scrollSpeed + SCROLL_SPEED_INC);
  }

  IncreaseDepth(d);

  if (minDepth > s_depth)
  {
    s_depth = minDepth;
  }
}
}
