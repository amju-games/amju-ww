#include <Game.h>
#include <GuiText.h>
#include <StringUtils.h>
#include <Timer.h>
#include "GameConsts.h"
#include "GSHiScores.h"
#include "GSMoreMenu.h"
#include "HiScoreDb.h"
#include "WWLoadGui.h"

namespace Amju
{
static const float SMOOTH_SCROLL_VEL = 0.4f;
  
static void OnBack(GuiElement*)
{
  TheGSHiScores::Instance()->GoBack();
}

GSHiScores::GSHiScores() :
  m_mode(HISCORE_MODE_SMOOTH_SCROLL), m_target(-1), m_current(-1), m_comp(nullptr), m_numScores(0)
{
}

void GSHiScores::SetTarget(int target)
{
  if (target < 0)
  {
    m_mode = HISCORE_MODE_SMOOTH_SCROLL;
  }
  else
  {
    m_mode = HISCORE_MODE_SCROLL_TO_TARGET;
    m_target = target;
  }
}

void GSHiScores::Update()
{
  GSText::Update();

  // Options:
  // 1. Auto scroll scores slowly
  // 2. Quickly scroll (with easing) to target score line
  // 3. User is swiping, so no auto scrolling.

  Assert(m_comp);

  float scrollVel = 0;
  if (m_mode == HISCORE_MODE_SMOOTH_SCROLL)
  {
    scrollVel = SMOOTH_SCROLL_VEL; // varies if we have a target line
  }
  else if (m_mode == HISCORE_MODE_SCROLL_TO_TARGET)
  {
    int d = m_target - m_current;
    if (d > 0)
    {
      scrollVel = SMOOTH_SCROLL_VEL + SMOOTH_SCROLL_VEL * (float)d * 0.1f; // TODO
    }
    else
    {
      scrollVel = SMOOTH_SCROLL_VEL * 0.25f; // slowly continue..?
    }
  }
  
  float dt = TheTimer::Instance()->GetDt();
  Vec2f pos = m_comp->GetLocalPos();
  pos.y += scrollVel * dt; // go UP
  m_comp->SetLocalPos(pos);
  
  // Hide scores below some y value (all hidden by default, then become visible as pos.y > the limit)
  // TODO Ratchet sound effect as pos.y passes some threshold (like F Zero X)
  // Increment current count as we make a new line visible
  
  for (int i = 0; i < m_numScores; i++)
  {
    GuiElement* line = m_comp->GetChild(i);
    Vec2f pos = line->GetCombinedPos();
    
    // Make lines above the bottom of the screen visible
    bool vis = pos.y > -0.6f;
    
    if (vis & !line->IsVisible())
    {
      line->SetVisible(true);
      // Changing to visible
      m_current++;
      // Play sound, maybe on m_current % <something>
    }
    
    // TODO also make lines off the top of the screen invisible, and exit state when all lines are invisible.
    if (pos.y > 1.0f)
    {
      line->SetVisible(false);
      if (i == (m_numScores - 1) && (m_mode == HISCORE_MODE_SMOOTH_SCROLL || m_mode == HISCORE_MODE_SCROLL_TO_TARGET))
      {
        // The last score just went off the top of the screen
        GoBack();
      }
    }
  }
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
  m_comp = comp;
  
  // GLOBAL scores
  HiScoreVec scores;
  TheGlobalHiScoreDb::Instance()->GetTopN(HI_SCORE_TOP_N, &scores);
  m_numScores = static_cast<int>(scores.size());
  float y = 0;
  const float LINE_SPACING = 0.15; // TODO CONFIG
  
  for (int i = 0; i < m_numScores; i++)
  {
    // Load 'score line' GUI
    // TODO Could load special versions for top 10, top 3, etc., which change font size,
    //  colours, etc.
    // TODO And rainbow colours for all the other lines
    RCPtr<GuiElement> line = WWLoadGui("gui-hiscore-line.txt", false);
    
    line->SetLocalPos(Vec2f(0, y));
    line->SetVisible(false); // we unhide it later in Update()
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
  
  m_current = 0;
}

} // namespace
