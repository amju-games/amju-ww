#include "BlinkCharacter.h"
#include "Timer.h"
#include "ResourceManager.h"
#include "OnFloorCharacter.h"

namespace Amju
{
BlinkCharacter::BlinkCharacter()
{
  m_blinkTime = 0;
}

bool BlinkCharacter::LoadTextures(const std::string& tex1, const std::string& tex2)
{
  m_pTex[0] = (Texture*)TheResourceManager::Instance()->GetRes(tex1);
  Assert(m_pTex[0]);

  m_pTex[1] = (Texture*)TheResourceManager::Instance()->GetRes(tex2);
  Assert(m_pTex[1]);

  return true;
}

void BlinkCharacter::Draw()
{
  int blink = 0;

  m_blinkTime += TheTimer::Instance()->GetDt();
  // TODO CONFIG ? Or random
  if (m_blinkTime > 3.0f && m_blinkTime <= 3.2f)
  {
    blink = 1;
  }
  else if (m_blinkTime > 3.2f)
  {
    m_blinkTime = 0;
  }

  m_pTex[blink]->UseThisTexture();

  Animated::Draw();
}

void BlinkCharacter::UpdateAnim(OnFloorCharacter* ofc)
{
  Vec3f vel = ofc->GetVel();
  vel.y = 0; // Only consider x-z speed
  float speed = vel.SqLen(); 
  static const float RUN_SPEED = 20.0f;
  static const float RUN_SPEED_2 = RUN_SPEED * RUN_SPEED;

  static const float STAND_SPEED = 10.0f;
  static const float STAND_SPEED_2 = STAND_SPEED * STAND_SPEED;

  if (ofc->IsFalling())
  {
    int jump = m_pModel->GetAnimationFromName("jump");
    SetAnim(jump);
    // TODO something like GetCharacter()->SetAnim("jump");
  }
  // TODO Hysteresis
  else if (speed > RUN_SPEED_2) // && IsControlled())
  {
    int run = m_pModel->GetAnimationFromName("run");
    SetAnim(run);
  }
  else if (speed < STAND_SPEED_2) // NB Hysteresis to prevent anim flicker
  {
    int stand = m_pModel->GetAnimationFromName("stand");
    SetAnim(stand);
  }
}
}
