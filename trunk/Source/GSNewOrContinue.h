#pragma once

#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSNewOrContinue : public GSText
{
  GSNewOrContinue();
  friend class Singleton<GSNewOrContinue>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSNewOrContinue> TheGSNewOrContinue;
} // namespace

