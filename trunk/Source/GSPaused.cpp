#include "GSPaused.h"
#include <Game.h>
#include "MySceneGraph.h"
#include "GSMain.h"

namespace Amju
{
const char* GSPaused::NAME = "paused";

static void OnResume()
{
  TheGame::Instance()->SetCurrentState(TheGSMain::Instance());
}

void GSPaused::OnActive()
{
  GSText::OnActive();

  CreateText("paused"); // TODO localise
  m_timer = 0;

  // buttons
  m_gui = LoadGui("paused-gui.txt");
  Assert(m_gui);
  m_gui->GetElementByName("resume-button")->SetCommand(OnResume);
}
}
