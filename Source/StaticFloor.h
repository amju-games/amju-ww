#ifndef STATIC_FLOOR_H
#define STATIC_FLOOR_H

#include "Floor.h"

namespace Amju
{
class StaticFloor : public Floor
{
public:
  static const char* NAME;
  virtual void Update();
  virtual bool Load(File*);
};
}

#endif