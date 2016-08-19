#include <ConfigFile.h>
#include <Game.h>
#include <GuiTextEdit.h>
#include "Depth.h"
#include "GSHiScores.h"
#include "GSTitle.h"
#include "GSTweet.h"
#include "GSYouGotHiScore.h"
#include "HiScoreDb.h"
#include "iOSKeyboard.h"
#include "LevelManager.h"
#include "NetSend.h"
#include "Score.h"
#include "WWLoadGui.h"

namespace Amju
{
static const std::string LAST_NAME_KEY = "last_name_entered";
  
static void OnOk(GuiElement*)
{
  TheGSYouGotHiScore::Instance()->OnOk();
}

GSYouGotHiScore::GSYouGotHiScore()
{
}

void GSYouGotHiScore::OnOk()
{
  // Get name
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-name"));
  Assert(textEdit);
  std::string name = textEdit->GetText();
  
  // Send hi score to server
  // TODO Move this to NetSendHiScore
  int level = TheLevelManager::Instance()->GetLevelId();
  // Assuming 1-player game for now, not multiplayer (Wii) - - TODO
  int depth = static_cast<int>(GetCurrentDepth());
  auto scores = TheScores::Instance();
  int score = scores->GetScore(AMJU_P1);
  Vec3f pos(3, 4, 5); // TODO £W&*(£&Q*(&QWE(*W&EW*E(&WE*Q(WE&*QWE(&QW*E&QW*E(Q*W&E*QW(EQW&EQ(W
  NetSendHiScore(name, score, level, depth, pos);
  // -- response to this should be the latest global high scores, duh!
  
  // Store local hi score
  //   Hi(int score, int level, int depth, const std::string& nick, const Vec3f& pos)
  TheLocalHiScoreDb::Instance()->AddHiScore(Hi(score, level, depth, name, pos));
  
  // Add to global high scores if it is high enough?
  // Or just rely on reloading the global hi scores from server.
  
  // Go to Hi score state
  auto h = TheGSHiScores::Instance();
  h->SetPrevState(TheGSTitle::Instance());
  TheGame::Instance()->SetCurrentState(h);
}
  
void GSYouGotHiScore::Update()
{
  GSText::Update();

}

void GSYouGotHiScore::Draw()
{
  GSText::Draw();

}

void GSYouGotHiScore::Draw2d()
{
  GSText::Draw2d();
}

void GSYouGotHiScore::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-you-got-hi.txt");
  Assert(m_gui);

  m_gui->GetElementByName("ok-button")->SetCommand(Amju::OnOk);
  m_gui->GetElementByName("tweet-button")->SetCommand(OnTweet);
  
  // TODO LOCALISE
  GSTweet::SetDefaultText("Hey @AmjuGames! I just got a high score on Amju Rainbow Drop! amju.com #amju");

  // Show score
  int score = TheScores::Instance()->GetScore(AMJU_P1);
  IGuiText* scoreText = dynamic_cast<IGuiText*>(GetElementByName(m_gui, "text-score"));
  Assert(scoreText);
  scoreText->SetText(ToString(score));
  
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-name"));
  Assert(textEdit);
  
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  // TODO Default if empty? (Second param to GetValue)
  std::string name = gcf->GetValue(LAST_NAME_KEY);
  textEdit->SetText(name); // Set most recent nickname

#ifdef AMJU_IOS
  ((GuiTextEditIos*)textEdit)->ShowKeyboard(true);
#endif
}
  
void GSYouGotHiScore::OnDeactive()
{
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-name"));
  Assert(textEdit);
 
  // Save name to config for next time, however we leave this page
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  gcf->Set(LAST_NAME_KEY, textEdit->GetText());
  gcf->Save();

#ifdef AMJU_IOS
  ((GuiTextEditIos*)textEdit)->ShowKeyboard(false);
#endif
  
  GSText::OnDeactive();
}

} // namespace
