#pragma once


#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSAbout : public GSText
{
  GSAbout();
  friend class Singleton<GSAbout>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSAbout> TheGSAbout;
} // namespace

