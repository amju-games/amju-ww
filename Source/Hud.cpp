#include <GuiText.h>
#include <Timer.h>
#include <ROConfig.h>
#include "Hud.h"
#include "Score.h"
#include "WWLoadGui.h"

namespace Amju
{
static float s_lifeTimer = 0;
static float s_scoreExpandTimer[3] = { 0, 0, 0 };

bool Hud::Load()
{ 
  m_gui = WWLoadGui("hud-gui.txt");
  Assert(m_gui);
  return (m_gui != 0);
}
  
void Hud::ExpandScore(ScoreType st)
{
  s_scoreExpandTimer[(int) st] = 1.0f; // TODO CONFIG
}

void Hud::Draw()
{
  float dt = TheTimer::Instance()->GetDt();

  static const char* SCORE_NAME[3] = 
  {
    "p1-score-text", 
    "p2-score-text",
    "hi-score-text"
  };

  static const float origSize[3] = 
  {
    dynamic_cast<GuiText*>(m_gui->GetElementByName(SCORE_NAME[0]))->GetFontSize(),
    dynamic_cast<GuiText*>(m_gui->GetElementByName(SCORE_NAME[1]))->GetFontSize(),
    dynamic_cast<GuiText*>(m_gui->GetElementByName(SCORE_NAME[2]))->GetFontSize()
  };

  for (int i = 0; i < 3; i++)
  {
    if (s_scoreExpandTimer[i] > 0)
    {
      s_scoreExpandTimer[i] -= dt;
      if (s_scoreExpandTimer[i] < 0)
      {
        s_scoreExpandTimer[i] = 0;
      }
      GuiText* text = dynamic_cast<GuiText*>(m_gui->GetElementByName(SCORE_NAME[i]));
      Assert(text);
      static const float EXPAND_SCALE = ROConfig()->GetFloat("hud-expand-scale");
      text->SetFontSize(origSize[i] * (s_scoreExpandTimer[i] * EXPAND_SCALE + 1.0f));
      std::string s = text->GetText();
      text->SetText("");
      text->SetText(s); // force tri list rebuild
    }
  }

  if (s_lifeTimer > 0)
  {
    s_lifeTimer -= dt;
    if (s_lifeTimer < 0)
    {
      s_lifeTimer = 0;
    }
    static const char* GUI_NAME[4] = 
    {
      "heart-img1", 
      "p1-lives-text",
      "heart-img2", 
      "p2-lives-text"
    };
    float t = s_lifeTimer * 10;
    bool vis = (((int)t % 2) == 0);
    for (int i = 0; i < 4; i++)
    {
      GuiElement* elem = m_gui->GetElementByName(GUI_NAME[i]);
      Assert(elem);
      elem->SetVisible(vis);
    }
  } 

  m_gui->Draw();
}

void Hud::FlashLives()
{
  static const float MAX_LIFE_FLASH = ROConfig()->GetFloat("hud-max-life-flash");
  s_lifeTimer = MAX_LIFE_FLASH;
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
