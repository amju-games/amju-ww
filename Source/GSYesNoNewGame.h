#pragma once

#include <Singleton.h>
#include "GSYesNo.h"

namespace Amju
{
class GSYesNoNewGame : public GSYesNo
{
public:
  GSYesNoNewGame();
  virtual void OnYes();
};

typedef Singleton<GSYesNoNewGame> TheGSYesNoNewGame;
}

