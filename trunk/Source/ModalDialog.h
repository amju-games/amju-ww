#pragma once

#include <GameState.h>
#include <GuiDialog.h>

namespace Amju
{
class Dialog;
typedef RCPtr<Dialog> PDialog;

void DoModalDialog(Dialog* dlg);

class Dialog : public GameState
{
public:
  Dialog();

  void SetPrevState(GameState*);

  virtual void Draw() override;
  virtual void Draw2d() override;
  virtual void Update() override;
  virtual void OnActive() override;
  virtual void OnDeactive() override;

  void Close();

  virtual void GetDlgContents() = 0;
  virtual void SetDlgContents() = 0;

  virtual bool OnKeyEvent(const KeyEvent&) override; 
  virtual bool OnCursorEvent(const CursorEvent&) override;
  virtual bool OnRotationEvent(const RotationEvent&) override;
  virtual bool OnJoyAxisEvent(const JoyAxisEvent&) override;
  virtual bool OnButtonEvent(const ButtonEvent&) override;
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&) override;
  virtual bool OnDoubleClickEvent(const DoubleClickEvent&) override;
  virtual bool OnBalanceBoardEvent(const BalanceBoardEvent&) override;
  virtual bool OnTextEvent(const TextEvent&) override;
  
protected:
  GameState* m_prevState;
  PGuiElement m_gui;
  std::string m_guiFilename;
};

class FileDialog : public Dialog
{
public:
  FileDialog();
  virtual void GetDlgContents() override; 
  virtual void SetDlgContents() override;

protected:

};
}

