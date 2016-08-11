#pragma once


#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSHiScores : public GSText
{
  GSHiScores();
  friend class Singleton<GSHiScores>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSHiScores> TheGSHiScores;
} // namespace

