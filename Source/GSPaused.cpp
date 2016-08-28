#include <Game.h>
#include <GuiButton.h>
#include "GSPaused.h"
#include "GSYesNoQuitGame.h"
#include "GSMain.h"
#include "GSOptions.h"
#include "GSTitle.h"
#include "MySceneGraph.h"
#include "Viewport.h" 
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
  GSYesNoQuitGame* q = TheGSYesNoQuitGame::Instance();
  q->SetPrevState(TheGSPaused::Instance());
  TheGame::Instance()->SetCurrentState(q);
}

static void OnResume(GuiElement*)
{
  TheGame::Instance()->SetCurrentState(TheGSMain::Instance());
}

void GSPaused::OnActive()
{
  GSText::OnActive();

  m_timer = 0;

  // buttons
  m_gui = WWLoadGui("gui-paused.txt");
  Assert(m_gui);

  GuiButton* resume = (GuiButton*)GetElementByName(m_gui, "resume-button");
  resume->SetCommand(OnResume);
  resume->SetIsFocusButton(true);
  resume->SetShowIfFocus(true);

  m_gui->GetElementByName("quit-button")->SetCommand(OnQuit);
  m_gui->GetElementByName("options-button")->SetCommand(OnOptions);
}
  
void GSPaused::Draw()
{
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    TheViewportManager::Instance()->GetViewport(i)->Draw();
  }
}
}
