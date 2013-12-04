#ifndef AI_EAT_PET_H
#define AI_EAT_PET_H

#include "AI.h"

namespace Amju
{
class Pet;

class AIEatPet : public AI
{
public:
  static const char* NAME;

  AIEatPet();
  virtual void Update() override;
  virtual const char* GetName() const override;
  virtual void OnActivated() override;
  virtual void OnAnimFinished() override;

private:
};
}

#endif
