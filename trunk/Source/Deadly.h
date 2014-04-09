#pragma once

#include "Fence.h"

namespace Amju
{
class Deadly : public Fence
{
public:
  static const char* NAME;
  Deadly();
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
};
}


