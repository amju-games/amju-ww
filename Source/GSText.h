#ifndef GAME_STATE_TEXT_H
#define GAME_STATE_TEXT_H

#include "GameState.h"
#include "GuiElement.h"
#include "SceneNode.h"

namespace Amju
{
class GSText;

// Listen for events - especially balance events to calibrate
class TextStateListener : public EventListener
{
public:
  TextStateListener(GSText* textState) : m_textState(textState) {}
  virtual bool OnBalanceBoardEvent(const BalanceBoardEvent&);

protected:
  GSText* m_textState;
};

class GSText : public GameState
{
public:
  GSText();
  
  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();
  virtual void OnDeactive();

  bool OnBalanceBoardEvent(const BalanceBoardEvent&);

protected:
  // Create m_scene from text
  void CreateText(const std::string& text);

protected:
  // Start button etc
  PGuiElement m_gui;

  // Time in current state
  float m_timer;

  RCPtr<TextStateListener> m_listener;
};
}

#endif
