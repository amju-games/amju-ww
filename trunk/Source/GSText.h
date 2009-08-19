#ifndef GAME_STATE_TEXT_H
#define GAME_STATE_TEXT_H

#include "GameState.h"
#include "GuiElement.h"
#include "SceneNode.h"

// TODO TEMP
#include "GuiImage.h"

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
  // Create scene from text
  void CreateText(const std::string& text);

protected:
  // Start button etc
  PGuiElement m_gui;

  // 3D text
  PSceneNode m_scene;
  
  // Time in current state
  float m_timer;
};
}

#endif
