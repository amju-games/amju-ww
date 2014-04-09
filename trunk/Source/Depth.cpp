#include <AmjuAssert.h>
#include <Timer.h>
#include <ROConfig.h>
#include "Depth.h"
#include "Hud.h"
#include "Score.h"
#include "Player.h"

namespace Amju
{
static float s_depth = 0;
static float s_scrollSpeed = 1.0f;
static float s_speedMult = 1.0f;

void SetScrollSpeedMult(float mult)
{
  s_speedMult = mult;
}

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
  TheHud::Instance()->SetDepth(0);
}

float GetCurrentDepth()
{
  return s_depth;
}

//void IncreaseDepth(float depth)
//{
//  Assert(depth >= 0); // ?
//  s_depth += depth;
//}

void DepthUpdate(float minDepth)
{
  float dt = TheTimer::Instance()->GetDt();

  float d = dt * s_scrollSpeed * s_speedMult;

  static float depthAtThisSpeed = 0;
  depthAtThisSpeed += d;
  static const float DEPTH_FOR_SPEED_CHANGE = ROConfig()->GetFloat("depth-for-speed-change");
  if (depthAtThisSpeed >= DEPTH_FOR_SPEED_CHANGE)
  {
    depthAtThisSpeed = 0;
    static const float SCROLL_SPEED_INC = ROConfig()->GetFloat("scroll-speed-inc");
    SetScrollSpeed(s_scrollSpeed + SCROLL_SPEED_INC);
  }

  s_depth += d; //IncreaseDepth(d);

  if (minDepth > s_depth)
  {
    s_depth = minDepth;
  }

  static float sec = 0;
  sec += dt;
  if (sec > 1.0f)
  {
    sec -= 1.0f;
    float y = std::max(0.0f, -Player::GetPlayer(AMJU_P1)->GetPos().y);
    TheHud::Instance()->SetDepth(y);

    TheScores::Instance()->AddToScore(AMJU_P1, 10);
  }
}
}
