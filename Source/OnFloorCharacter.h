#ifndef ON_FLOOR_CHARACTER_H
#define ON_FLOOR_CHARACTER_H

#include "OnFloor.h"

namespace Amju
{
class BlinkCharacter;

class OnFloorCharacter : public OnFloor
{
public:
  OnFloorCharacter();
  virtual void Update();
//  virtual AABB* GetAABB(); 

protected:
  void SetDir(float degs);

protected:
  //BlinkCharacter* m_pSceneNode;
};
}

#endif
