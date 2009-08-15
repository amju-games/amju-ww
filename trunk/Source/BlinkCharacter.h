#ifndef BLINK_CHARACTER_H
#define BLINK_CHARACTER_H

#include "Animated.h"
#include "Texture.h"

namespace Amju
{
class BlinkCharacter : public Animated
{
public:
  BlinkCharacter();
  virtual void Draw();

protected:
  // 2 textures for blinking 
  PTexture m_pTex[2];
  float m_blinkTime;

};
}

#endif
