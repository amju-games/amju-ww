#include "GSEditMenu.h"
#include "Game.h"

namespace Amju
{
const char* GSEditMenu::NAME = "gs-edit-menu";

static bool b = TheGame::Instance()->AddState(GSEditMenu::NAME, new GSEditMenu);

void GSEditMenu::OnActive()
{
  GSText::OnActive();

  /*
  m_gui = LoadGui("edit-menu-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("new-level-button")->SetCommand(new CommandEditNewLevel);
  */
}

}
