#pragma once

#include "GSMain.h"

namespace Amju
{
class GSAttract : public GSMain
{
public:
  virtual void Update() override;
  virtual void OnActive() override;
  virtual void Draw2d() override;

private:
  float m_timer;
};

typedef Singleton<GSAttract> TheGSAttract;
}

