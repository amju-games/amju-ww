#include <Game.h>
#include <CursorManager.h>
#include <GuiButton.h>
#include "ModalDialog.h"

namespace Amju
{
void DoModalDialog(Dialog* dlg)
{
  Game* game = TheGame::Instance();
  GameState* s = game->GetState();
  dlg->SetPrevState(s);
  game->SetCurrentState(dlg); 
}

static void DialogOnOk()
{
  Game* game = TheGame::Instance();
  GameState* s = game->GetState();
  Dialog* dlg = dynamic_cast<Dialog*>(s);
  Assert(dlg);
  dlg->GetDlgContents(); // load GUI strings into member variables
  dlg->Close();
}

static void DialogOnCancel()
{
  Game* game = TheGame::Instance();
  GameState* s = game->GetState();
  Dialog* dlg = dynamic_cast<Dialog*>(s);
  Assert(dlg);
  dlg->Close();
}

Dialog::Dialog()
{
  m_prevState = 0;
}

void Dialog::SetPrevState(GameState* s)
{
  m_prevState = s;
}

void Dialog::Draw()
{
  m_prevState->Draw();
}

void Dialog::Draw2d()
{
  m_prevState->Draw2d();
  m_gui->Draw();
  TheCursorManager::Instance()->Draw();
}

void Dialog::Update()
{
  m_gui->Update();
}

void Dialog::OnActive()
{
  m_gui = LoadGui(m_guiFilename, false); // don't add as listener 
  Assert(m_gui);
  // GUI should get events through this game state's handler functions
  //  - don't automatically add to EventPoller

  // Set OK and cancel buttons
  GuiButton* ok = (GuiButton*)m_gui->GetElementByName("ok-button");
  Assert(ok);
  ok->SetCommand(DialogOnOk);

  GuiButton* cancel = (GuiButton*)m_gui->GetElementByName("cancel-button");
  Assert(cancel);
  cancel->SetCommand(DialogOnCancel);
}

void Dialog::OnDeactive()
{
  m_gui = 0;
}

void Dialog::Close()
{
  TheGame::Instance()->SetCurrentState(m_prevState);
  // Copy any values from GUI elements to member variables

  // Call the callback function to say this dialog has finished

}

bool Dialog::OnKeyEvent(const KeyEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnKeyEvent(e);
  return true; 
}

bool Dialog::OnCursorEvent(const CursorEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnCursorEvent(e);
  return true; 
}

bool Dialog::OnRotationEvent(const RotationEvent& e) 
{
  Assert(m_gui);
  m_gui->OnRotationEvent(e);
  return true; 
}

bool Dialog::OnJoyAxisEvent(const JoyAxisEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnJoyAxisEvent(e);
  return true; 
}

bool Dialog::OnButtonEvent(const ButtonEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnButtonEvent(e);
  return true; 
}

bool Dialog::OnMouseButtonEvent(const MouseButtonEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnMouseButtonEvent(e);
  return true; 
}

bool Dialog::OnDoubleClickEvent(const DoubleClickEvent& e) 
{ 
  Assert(m_gui);
  m_gui->OnDoubleClickEvent(e);
  return true; 
}

bool Dialog::OnBalanceBoardEvent(const BalanceBoardEvent& e) 
{
  Assert(m_gui);
  m_gui->OnBalanceBoardEvent(e);
  return true; 
}

bool Dialog::OnTextEvent(const TextEvent& e) 
{
  Assert(m_gui);
  m_gui->OnTextEvent(e);
  return true; 
}

FileDialog::FileDialog()
{
  m_guiFilename = "gui-file-dialog.txt";
}

void FileDialog::GetDlgContents() 
{
}

void FileDialog::SetDlgContents() 
{
}
}

