#ifndef BALANCE_GAME_STATE_H
#define BALANCE_GAME_STATE_H

#include <vector>
#include <Singleton.h>
#include <EventListener.h>
#include <GuiElement.h>
#include <GuiButton.h>
#include <GameState.h>

namespace Amju
{
class GSMain : public GameState, public NonCopyable
{
protected:
  GSMain();
  friend class Singleton<GSMain>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void Update() override;
  virtual void Draw() override;
  virtual void Draw2d() override;
  virtual void OnActive() override;
  virtual void OnDeactive() override;
  virtual bool OnKeyEvent(const KeyEvent&) override;

  void ClearLevel();

  enum ExitState { NOT_EXITED, IS_EXITING, FINISHED_EXITING };
  void SetExitState(ExitState es);

  void SetClearColour(const Colour& col);

protected:
  ExitState m_exitState;
  float m_exitTimer;
  PGuiElement m_gui; // GUI elements (extra on HUD)
  RCPtr<GuiButton> m_pauseButton;
  Colour m_clearColour;
};
typedef Singleton<GSMain> TheGSMain;
}

#endif
