#include <GuiText.h>
#include "Hud.h"
#include "Score.h"

namespace Amju
{
bool Hud::Load()
{ 
  m_gui = LoadGui("hud-gui.txt");
  Assert(m_gui);
  return (m_gui != 0);
}

void Hud::Draw()
{
  m_gui->Draw();
}

void Hud::SetObjectiveText(const std::string& s)
{
  PGuiElement p = m_gui->GetElementByName("objective-text");
  Assert(p);
  dynamic_cast<GuiText*>(p.GetPtr())->SetText(s);
}

void Hud::UpdateScores()
{
  // Names of gui elements in hud gui text file
  const char* GUI_NAME[2][2] = 
  {
    { "p1-score-text", "p1-lives-text" },
    { "p2-score-text", "p2-lives-text" }
  };

  for (int i = 0; i < 2; i++)
  {
    Score::PlayerNum pn = (Score::PlayerNum)i;
    int score = Score::GetScore(pn);
    GuiText* t = (GuiText*)m_gui->GetElementByName(GUI_NAME[i][0]);
    Assert(t);
    t->SetText(ToString(score));
    int lives = Score::GetLives(pn); 
    t = (GuiText*)m_gui->GetElementByName(GUI_NAME[i][1]);
    Assert(t);
    t->SetText(ToString(lives));
  }
}

}
