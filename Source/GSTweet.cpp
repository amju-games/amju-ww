#include <Game.h>
#include "GSTweet.h"
#include "iOSKeyboard.h"
#include "WWLoadGui.h"

namespace Amju
{
// Call from other states
void OnTweet(GuiElement*)
{
  GSTweet* g = TheGSTweet::Instance();
  g->SetPrevState(TheGame::Instance()->GetState());
  TheGame::Instance()->SetCurrentState(g);
}

static void OnBack(GuiElement*)
{
  TheGSTweet::Instance()->GoBack();
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

void GSTweet::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-tweet.txt");
  Assert(m_gui);

  // TODO Set focus element, cancel element, command handlers
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
  GetElementByName(m_gui, "tweet-button")->SetCommand(OnTweet);
  
  // TODO Get number of accounts. If zero, we shouldn't be here.
  // If one, hide accounts button and centre back button.
  // Accounts button goes to account select page, which comes back here.
  
  
#ifdef AMJU_IOS
  ShowKeyboard(true);
#endif
}
  
} // namespace
