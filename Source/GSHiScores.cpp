#include <Game.h>
#include <GuiText.h>
#include <StringUtils.h>
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
  
  // Local scores
  HiScoreVec scores;
  TheGlobalHiScoreDb::Instance()->GetTopNLocked(10, &scores);
  for (int i = 0; i < 10; i++)
  {
    GuiElement* name = GetElementByName(m_gui, "name" + ToString(i + 1));
    GuiElement* score = GetElementByName(m_gui, "sc" + ToString(i + 1));
    if (i >= scores.size())
    {
      name->SetVisible(false);
      score->SetVisible(false);
    }
    else
    {
      name->SetVisible(true);
      score->SetVisible(true);
      const Hi& hi = scores[i];
      
      IGuiText* nameText = dynamic_cast<IGuiText*>(name);
      Assert(nameText);
      nameText->SetText(hi.m_nick);
      
      IGuiText* scoreText = dynamic_cast<IGuiText*>(score);
      Assert(scoreText);
      scoreText->SetText(ToString(hi.m_score));
    }
  }
}

} // namespace
