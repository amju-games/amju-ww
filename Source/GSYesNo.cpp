#include <AmjuFirst.h>
#include <Game.h>
#include <GuiButton.h>
#include <GuiText.h>
#include "GSYesNo.h"
#include <AmjuFinal.h>

namespace Amju
{
static void OnYes(GuiElement*)
{
  GSYesNo* yn = dynamic_cast<GSYesNo*>(TheGame::Instance()->GetState());
  Assert(yn);
  yn->OnYes();
}

static void OnNo(GuiElement*)
{
  GSYesNo* yn = dynamic_cast<GSYesNo*>(TheGame::Instance()->GetState());
  Assert(yn);
  yn->OnNo();
}

GSYesNo::GSYesNo() : m_yesRed(true)
{
}

void GSYesNo::Update()
{
  GSText::Update();
}

void GSYesNo::Draw()
{
  GSText::Draw();
}

void GSYesNo::Draw2d()
{
  GSText::Draw2d();
}

void GSYesNo::OnActive()
{
  GSText::OnActive();

  m_gui = LoadGui("gui-yesno.txt");
  Assert(m_gui);

  GuiButton* yes = (GuiButton*)GetElementByName(m_gui, "yes-button");
  yes->SetCommand(Amju::OnYes);
  yes->SetText(m_yesText);

  GuiButton* no = (GuiButton*)GetElementByName(m_gui, "no-button");
  no->SetCommand(Amju::OnNo);
  no->SetText(m_noText);
  
  IGuiText* q = dynamic_cast<IGuiText*>(GetElementByName(m_gui, "question"));
  q->SetText(m_question);

  // Set safe button (blue, pulsing) and non-undoable (red)
  // TODO Decouple these colour signals from keyboard bindings
  if (m_yesRed)
  {
    no->SetHasFocus(true); // blue, pulsing
    yes->SetIsCancelButton(true);  // red
  }
  else
  {
    yes->SetHasFocus(true); // blue, pulsing
    no->SetIsCancelButton(true);  // red
  }
}

} // namespace
