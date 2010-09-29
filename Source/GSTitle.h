#ifndef TITLE_GAME_STATE_H
#define TITLE_GAME_STATE_H

#include "GSText.h"
#include <Singleton.h>

namespace Amju
{
class GSTitle : public GSText
{
private:
  GSTitle();
  friend class Singleton<GSTitle>;

public:
  static const char* NAME;

  // GSText overrides
  virtual void OnActive();
};
typedef Singleton<GSTitle> TheGSTitle;
}

#endif
