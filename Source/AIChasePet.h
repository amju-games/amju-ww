#ifndef AI_CHASE_PET_H
#define AI_CHASE_PET_H

#include "AI.h"

namespace Amju
{
class AIChasePet : public AI
{
public:
  static const char* NAME;
  virtual const char* GetName() const;
  virtual void Update();
  virtual float GetRank();
};
}

#endif
