#ifndef GS_OPTIONS_H
#define GS_OPTIONS_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSOptions : public GSText, public NonCopyable
{
private:
  GSOptions() {}
  friend class Singleton<GSOptions>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive() override;
};
typedef Singleton<GSOptions> TheGSOptions;
}

#endif

