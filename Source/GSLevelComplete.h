#ifndef GS_LEVEL_COMPLETE_H
#define GS_LEVEL_COMPLETE_H

#include "GSText.h"

namespace Amju
{
class GSLevelComplete : public GSText
{
public:
  static const char* NAME;

  GSLevelComplete();

  virtual void Update();
  virtual void OnActive();
  virtual void Draw(); // draw scene, with text superimposed  

protected:
  float m_timer;
};
}

#endif

