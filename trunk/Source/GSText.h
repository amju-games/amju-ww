#ifndef GAME_STATE_TEXT_H
#define GAME_STATE_TEXT_H

#include "GameState.h"
#include "GuiElement.h"
#include "SceneNode.h"

namespace Amju
{
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

protected:
  // Create m_scene from text
  void CreateText(const std::string& text);

protected:
  // Start button etc
  PGuiElement m_gui;

  // Time in current state
  float m_timer;
};
}

#endif
