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
    PlayerNum pn = (PlayerNum)i;
    int score = TheScores::Instance()->GetScore(pn);
    GuiText* t = (GuiText*)m_gui->GetElementByName(GUI_NAME[i][0]);
    Assert(t);
    t->SetText(ToString(score));
    int lives = TheScores::Instance()->GetLives(pn); 
    t = (GuiText*)m_gui->GetElementByName(GUI_NAME[i][1]);
    Assert(t);
    t->SetText(ToString(lives));
  }

  int hiScore = TheScores::Instance()->GetHiScore();
  GuiText* t = (GuiText*)m_gui->GetElementByName("hi-score-text");
  Assert(t);
  t->SetText(ToString(hiScore));
  t = (GuiText*)m_gui->GetElementByName("hi-name-text");
  Assert(t);
  t->SetText(TheScores::Instance()->GetHiScoreName()); 
}

void Hud::SetNumPlayers(int num)
{
  GuiElement* elem = m_gui->GetElementByName("p2-comp");
  Assert(elem);
  elem->SetVisible(num == 2);
}

}
