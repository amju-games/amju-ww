#ifndef GAME_STATE_TEXT_H
#define GAME_STATE_TEXT_H

#include <GameState.h>
#include <GuiElement.h>
#include <SceneNodeCamera.h>

namespace Amju
{
class GSText;

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

  // Calibrate tilt control 
  bool OnBalanceBoardEvent(const BalanceBoardEvent&);

  void GoToNewState(GameState* gs);

protected:
  // Create m_scene from text
  void CreateText(const std::string& text);

protected:
  // Start button etc
  PGuiElement m_gui;

  // Time in current state
  float m_timer;

  SceneNode* m_stars[2];
  SceneNodeCamera* m_camera;

  float m_starRotVel;

  float m_yPos;
  float m_yVel;

  GameState* m_nextState;
  float m_nextTimer;
};
}

#endif
