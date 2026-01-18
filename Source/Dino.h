#ifndef DINO_H
#define DINO_H

#include "OnFloor.h"

namespace Amju
{
class Dino : public OnFloor
{
public:
  static const char* NAME;

  Dino();
  virtual const char* GetTypeName() const;
  virtual void Draw();
  virtual void Update();
  virtual bool Load(File*);

protected:
  // Timer - must reach limit, then we can decide what direction to move in etc.
  float m_decideTime;
};
}

#endif
