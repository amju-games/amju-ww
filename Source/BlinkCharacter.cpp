#include "BlinkCharacter.h"
#include "Timer.h"

namespace Amju
{
BlinkCharacter::BlinkCharacter()
{
  m_blinkTime = 0;
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
}
