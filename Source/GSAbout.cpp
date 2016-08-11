#include <Game.h>
#include "GSAbout.h"
#include "GSMoreMenu.h"
#include "WWLoadGui.h"

namespace Amju
{
static void OnBack(GuiElement*)
{
  GSMoreMenu* g = TheGSMoreMenu::Instance();
  TheGame::Instance()->SetCurrentState(g);
}

GSAbout::GSAbout()
{
}

void GSAbout::Update()
{
  GSText::Update();

}

void GSAbout::Draw()
{
  GSText::Draw();

}

void GSAbout::Draw2d()
{
  GSText::Draw2d();
}

void GSAbout::OnActive()
{
  GSText::OnActive();

  m_gui = WWLoadGui("gui-about.txt");
  Assert(m_gui);

  // TODO Set focus element, cancel element, command handlers
  GetElementByName(m_gui, "back-button")->SetCommand(OnBack);
}

} // namespace
