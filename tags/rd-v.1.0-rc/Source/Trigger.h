#ifndef TRIGGER_H
#define TRIGGER_H

#include "WWGameObject.h"

namespace Amju
{
class Player;

class Trigger : public WWGameObject
{
public:
  Trigger();

  virtual void OnPlayerCollision(Player*) = 0;

  virtual bool Load(File*); 
  virtual bool Save(File*); 

protected:
  virtual bool CreateSceneNode();
};
}

#endif
