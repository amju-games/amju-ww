#ifndef GS_PAUSED_H
#define GS_PAUSED_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSPaused : public GSText, public NonCopyable
{
private:
  GSPaused() {}
  friend class Singleton<GSPaused>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive();
  //virtual void OnDeactive();
  //virtual void Update();
};
typedef Singleton<GSPaused> TheGSPaused;
}

#endif

