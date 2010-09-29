#ifndef TRIGGER_H
#define TRIGGER_H

#include "WWGameObject.h"

namespace Amju
{
class Player;

class Trigger : public WWGameObject
{
public:
  virtual void OnPlayerCollision(Player*) = 0;

  virtual bool Load(File*); 
  virtual AABB* GetAABB(); 

protected:
  AABB m_aabb;
};
}

#endif