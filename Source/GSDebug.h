#pragma once


#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSDebug : public GSText
{
  GSDebug();
  friend class Singleton<GSDebug>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSDebug> TheGSDebug;
} // namespace

