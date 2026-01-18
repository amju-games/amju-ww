#include <Game.h>
#include <GuiButton.h>
#include "GSPaused.h"
#include "MySceneGraph.h"
#include "GSMain.h"
#include "GSOptions.h"
#include "GSTitle.h"
#include "WWLoadGui.h"

namespace Amju
{
const char* GSPaused::NAME = "paused";

static void OnOptions(GuiElement*)
{
  GSOptions* options = TheGSOptions::Instance();
  GSPaused* paused = TheGSPaused::Instance();

  options->SetPrevState(paused);
  paused->GoToNewState(options);
}

static void OnQuit(GuiElement*)
{
  // TODO Confirm state, hi score should be saved anyway
  TheGame::Instance()->SetCurrentState(TheGSTitle::Instance());
}

static void OnResume(GuiElement*)
{
  TheGame::Instance()->SetCurrentState(TheGSMain::Instance());
}

void GSPaused::OnActive()
{
  GSText::OnActive();

  CreateText("paused"); // TODO localise
  m_timer = 0;

  // buttons
  m_gui = WWLoadGui("paused-gui.txt");
  Assert(m_gui);

  GuiButton* resume = (GuiButton*)GetElementByName(m_gui, "resume-button");
  resume->SetCommand(OnResume);
  resume->SetIsFocusButton(true);
  resume->SetShowIfFocus(true);

  m_gui->GetElementByName("quit-button")->SetCommand(OnQuit);
  m_gui->GetElementByName("options-button")->SetCommand(OnOptions);
}
}
