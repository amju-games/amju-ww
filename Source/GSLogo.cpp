#include <math.h>
#include "GSLogo.h"
#include "Game.h"
#include "Timer.h"
#include "Colour.h"
#include "GSTitle.h"
#include "SoundManager.h"

namespace Amju
{
const char* GSLogo::NAME = "start";

static bool b = TheGame::Instance()->AddState(GSLogo::NAME, new GSLogo);

void Done()
{
  TheGame::Instance()->SetCurrentState(GSTitle::NAME);
}

GSLogo::GSLogo()
{
  m_fade = 0;
}

void GSLogo::OnActive()
{
  GameState::OnActive();
  m_image.OpenAndLoad("splash-gui.txt");

  // TODO TEMP TEST
  TheSoundManager::Instance()->PlayWav("churchbell"); // NB No file ext

}

void GSLogo::Update()
{
  m_fade += TheTimer::Instance()->GetDt();
}

void GSLogo::Draw()
{
}

void GSLogo::Draw2d()
{
  PushColour();
  float s = sin(m_fade);
  if (s < 0)
  {
    s = 0;
    Done();
  }
  MultColour(Colour(s, s, s, 1.0f));
  m_image.Draw();
  PopColour();
}

void GSLogo::OnKeyEvent(const KeyEvent& ke)
{
  Done();
}
}
