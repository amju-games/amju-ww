#ifndef AI_F_HIGH_GROUND_H
#define AI_F_HIGH_GROUND_H

#include "AI.h"

namespace Amju
{
class AIGoHighGround : public AI
{
public:
  static const char* NAME;

  virtual void Update();
  virtual const char* GetName() const;
  virtual float GetRank();

protected:

};
}

#endif
