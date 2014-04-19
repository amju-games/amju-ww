#pragma once

#include "AI.h"

namespace Amju
{
class AIFlee : public AI
{
public:
  static const char* NAME;

  virtual void Update();
  virtual const char* GetName() const;
  virtual float GetRank();

protected:

};
}

