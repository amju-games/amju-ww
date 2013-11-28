#include <Game.h>
#include "GSEditMenu.h"
#include "WWLoadGui.h"

namespace Amju
{
const char* GSEditMenu::NAME = "gs-edit-menu";

void GSEditMenu::OnActive()
{
  GSText::OnActive();

  /*
  m_gui = WWLoadGui("edit-menu-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("new-level-button")->SetCommand(new CommandEditNewLevel);
  */
}

}
