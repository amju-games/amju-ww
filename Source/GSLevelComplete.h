#ifndef GS_LEVEL_COMPLETE_H
#define GS_LEVEL_COMPLETE_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSLevelComplete : public GSText, public NonCopyable
{
private:
  GSLevelComplete();
  friend class Singleton<GSLevelComplete>;

public:
  static const char* NAME;

  virtual void Update();
  virtual void OnActive();
  virtual void Draw(); // draw scene, with text superimposed  

protected:
  float m_timer;
};
typedef Singleton<GSLevelComplete> TheGSLevelComplete;
}

#endif

