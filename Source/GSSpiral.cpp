#include <Timer.h>
#include "GSSpiral.h"

namespace Amju
{
GSSpiral::GSSpiral()
{
  m_timer = 0;
  if (!m_bg.OpenAndLoad("level-complete-bg.txt"))
  {
    Assert(0);
  }
}

void GSSpiral::Update() 
{
  static Timer* timer = TheTimer::Instance();
  m_timer += timer->GetDt();
  if (m_timer > 10.5f)
  {
    GoBack();
  }
}

void GSSpiral::OnActive() 
{
  m_timer = 0;
  GameState::OnActive();

  // TODO play wav
}

//void GSSpiral::OnDeactive() 
//{
//}

void GSSpiral::Draw() 
{
}

void GSSpiral::Draw2d() 
{
  // Draw rotating background
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_WRITE);

  // Rotate background
  static float a = 0;
  float dt = TheTimer::Instance()->GetDt();
  a -= 700.0f * dt;

  AmjuGL::PushMatrix();
  AmjuGL::RotateZ(a);
  m_bg.Draw(); 
  AmjuGL::PopMatrix();

  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_WRITE);
}
}


