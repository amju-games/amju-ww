#include <Game.h>
#include <GuiTextEdit.h>
#include "GSTweet.h"
#include "iOSKeyboard.h"
#include "iOSTweet.h"
#include "WWLoadGui.h"

namespace Amju
{
static std::string s_defaultText;

// Call from other states -- NOT static
void OnTweet(GuiElement*)
{
  GSTweet* tweet = TheGSTweet::Instance();
  auto* current = TheGame::Instance()->GetState();
  Assert(current != tweet); // how did this happen?
  tweet->SetPrevState(current);
  TheGame::Instance()->SetCurrentState(tweet);
}

// Actually send the tweet
static void OnSendTweet(GuiElement*)
{
  TheGSTweet::Instance()->OnSendTweet();
}
  
static void OnTweetTextChanged(GuiElement*)
{
  TheGSTweet::Instance()->UpdateCharCount();
}

static void OnBack(GuiElement*)
{
  TheGSTweet::Instance()->GoBack();
}
  
void GSTweet::SetDefaultText(const std::string& text)
{
  s_defaultText = text;
}

GSTweet::GSTweet()
{
}

void GSTweet::Update()
{
  GSText::Update();
}

void GSTweet::Draw()
{
  GSText::Draw();
}

void GSTweet::Draw2d()
{
  GSText::Draw2d();
}

void GSTweet::UpdateCharCount()
{
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-tweet"));
  Assert(textEdit);
  int numCh = static_cast<int>(textEdit->GetText().size());
  IGuiText* charCount = dynamic_cast<IGuiText*>(GetElementByName(m_gui, "char-count"));
  Assert(charCount);
  numCh = 160 - numCh;
  charCount->SetText(ToString(numCh));
  // TODO Different colour if low?
}
  
void GSTweet::OnSendTweet()
{
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-tweet"));
  Assert(textEdit);

  TwitterPostMessage(0, textEdit->GetText());
}
  
void GSTweet::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-tweet.txt");
  Assert(m_gui);

  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
  GetElementByName(m_gui, "tweet-button")->SetCommand(Amju::OnSendTweet);
  
  // TODO Get number of accounts. If zero, we shouldn't be here?
  // OR Show a message, e.g. "Please log in to your Twitter account using the Twitter app"
  // If one account, hide accounts button and centre back button.
  // Accounts button goes to account select page, which comes back here.
  // Save/restore most recently used account in config.
  
  IGuiTextEdit* textEdit = dynamic_cast<IGuiTextEdit*>(GetElementByName(m_gui, "edit-tweet"));
  Assert(textEdit);
  textEdit->SetOnChangeFunc(OnTweetTextChanged);
  textEdit->SetText(s_defaultText);
  
#ifdef AMJU_IOS
  dynamic_cast<GuiTextEditIos*>(textEdit)->ShowKeyboard(true);
#endif
  
  UpdateCharCount();
}
  
void GSTweet::OnDeactive()
{
#ifdef AMJU_IOS
  GuiTextEditIos* textEdit = (GuiTextEditIos*)GetElementByName(m_gui, "edit-tweet");
  textEdit->ShowKeyboard(false);
#endif
  
  GSText::OnDeactive();  
}
} // namespace
