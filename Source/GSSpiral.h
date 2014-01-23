#pragma once

#include <GameState.h>
#include <GuiImage.h>

namespace Amju
{
class GSSpiral : public GameState
{
private:
  GSSpiral();
  friend class Singleton<GSSpiral>;

public:
  virtual void Update() override;
  virtual void OnActive() override;
  //virtual void OnDeactive() override;
  virtual void Draw() override;
  virtual void Draw2d() override;

private:
  GuiImage m_bg;
  float m_timer;
};

typedef Singleton<GSSpiral> TheGSSpiral;
}
