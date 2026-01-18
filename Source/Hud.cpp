#include "Hud.h"
#include <GuiText.h>

namespace Amju
{
bool Hud::Load()
{ 
  m_gui = LoadGui("hud-gui.txt");
  Assert(m_gui);
  return (m_gui != 0);
}

void Hud::Draw()
{
  m_gui->Draw();
}

void Hud::SetObjectiveText(const std::string& s)
{
  PGuiElement p = m_gui->GetElementByName("objective-text");
  Assert(p);
  dynamic_cast<GuiText*>(p.GetPtr())->SetText(s);
}

}
