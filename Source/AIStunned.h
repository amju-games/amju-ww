#pragma once

#include "AI.h"

namespace Amju
{
// Dino is stunned for a few seconds
class AIStunned : public AI
{
public:
  static const char* NAME;

  AIStunned();
  virtual void OnActivated() override;
  virtual void Update() override;
  virtual const char* GetName() const override;
};
}

