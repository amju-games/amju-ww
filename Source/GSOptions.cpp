#include "GSOptions.h"

namespace Amju
{
const char* GSOptions::NAME = "gs-options";

static void OnBack()
{
  TheGSOptions::Instance()->GoBack();
}

void GSOptions::OnActive()
{
  GSText::OnActive();

  CreateText("options"); // TODO localise
  m_timer = 0;

  // buttons
  m_gui = LoadGui("options-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("back-button")->SetCommand(OnBack);
}
}


