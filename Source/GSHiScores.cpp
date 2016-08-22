#include <Game.h>
#include <GuiComposite.h>
#include <GuiText.h>
#include <StringUtils.h>
#include <Timer.h>
#include "GSHiScores.h"
#include "GSMoreMenu.h"
#include "HiScoreDb.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnBack(GuiElement*)
{
  TheGSHiScores::Instance()->GoBack();
}

GSHiScores::GSHiScores()
{
}

void GSHiScores::Update()
{
  GSText::Update();

  // Options:
  // 1. Auto scroll scores slowly
  // 2. Quickly scroll (with easing) to target score line
  // 3. User is swiping, so no auto scrolling.

  // TODO Member var
  GuiComposite* comp = dynamic_cast<GuiComposite*>(GetElementByName(m_gui, "hi-scores-list-comp"));
  Assert(comp);

  // TODO TEMP TEST
  float scrollVel = 0.4f; // varies if we have a target line
  float dt = TheTimer::Instance()->GetDt();
  Vec2f pos = comp->GetLocalPos();
  pos.y += scrollVel * dt; // go UP
  comp->SetLocalPos(pos);
  
  // TODO Hide scores below some y value (all hidden by default, then become visible as pos.y > the limit)
  
  // TODO Sound effect as pos.y passes some threshold (like F Zero X) 
}

void GSHiScores::Draw()
{
  GSText::Draw();

}

void GSHiScores::Draw2d()
{
  GSText::Draw2d();
}

void GSHiScores::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-hiscores.txt");
  Assert(m_gui);

  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
  
  // Get composite parent for all hi score lines
  GuiComposite* comp = dynamic_cast<GuiComposite*>(GetElementByName(m_gui, "hi-scores-list-comp"));
  Assert(comp);
  
  // GLOBAL scores
  HiScoreVec scores;
  TheGlobalHiScoreDb::Instance()->GetTopNLocked(10, &scores);
  int numScores = static_cast<int>(scores.size());
  float y = 0;
  const float LINE_SPACING = 0.15; // TODO CONFIG
  
  for (int i = 0; i < numScores; i++)
  {
    // Load 'score line' GUI
    // TODO Could load special versions for top 10, top 3, etc., which change font size,
    //  colours, etc.
    GuiElement* line = WWLoadGui("gui-hiscore-line.txt");
    
    line->SetLocalPos(Vec2f(0, y));
    comp->AddChild(line);
    
    GuiElement* num = GetElementByName(line, "score-num");
    GuiElement* name = GetElementByName(line, "score-name");
    GuiElement* score = GetElementByName(line, "score-score");
    
    const Hi& hi = scores[i];

    IGuiText* numText = dynamic_cast<IGuiText*>(num);
    Assert(numText);
    numText->SetText(ToString(i + 1));

    IGuiText* nameText = dynamic_cast<IGuiText*>(name);
    Assert(nameText);
    nameText->SetText(hi.m_nick);
    
    IGuiText* scoreText = dynamic_cast<IGuiText*>(score);
    Assert(scoreText);
    scoreText->SetText(ToString(hi.m_score));
    
    y -= LINE_SPACING; // go down screen
  }
}

} // namespace
