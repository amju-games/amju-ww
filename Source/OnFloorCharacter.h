#ifndef ON_FLOOR_CHARACTER_H
#define ON_FLOOR_CHARACTER_H

#include "OnFloor.h"

namespace Amju
{
class OnFloorCharacter : public OnFloor
{
public:
  OnFloorCharacter();
  virtual void Update();

protected:
  void SetDir(float degs);

protected:
};
}

#endif
