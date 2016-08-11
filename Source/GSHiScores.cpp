#include <Game.h>
#include "GSHiScores.h"
#include "GSMoreMenu.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnBack(GuiElement*)
{
  GSMoreMenu* g = TheGSMoreMenu::Instance();
  TheGame::Instance()->SetCurrentState(g);
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

  // TODO Set focus element, cancel element, command handlers
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
}

} // namespace
