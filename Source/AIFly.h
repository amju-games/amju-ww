#pragma once

#include "AI.h"

namespace Amju
{
class AIFly : public AI
{
public:
  AIFly();
  static const char* NAME;
  virtual const char* GetName() const;
  virtual void OnActivated();
  virtual void Update();
};
}
