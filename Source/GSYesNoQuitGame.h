#pragma once

#include <Singleton.h>
#include "GSYesNo.h"

namespace Amju
{
class GSYesNoQuitGame : public GSYesNo
{
public:
  GSYesNoQuitGame();
  virtual void OnYes();
};

typedef Singleton<GSYesNoQuitGame> TheGSYesNoQuitGame;
}

