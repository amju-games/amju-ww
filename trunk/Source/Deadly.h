#pragma once

#include "StaticFloor.h"

namespace Amju
{
class Deadly : public StaticFloor
{
public:
  static const char* NAME;
  Deadly();
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
};
}


