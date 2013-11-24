#pragma once

#include "AI.h"

namespace Amju
{
class Pet;

// Dino turns to face pet. Once facing pet, we can go to Eat state.
class AITurnToFace : public AI
{
public:
  static const char* NAME;

  AITurnToFace();
  virtual void Update();
  virtual const char* GetName() const;

private:
};
}

