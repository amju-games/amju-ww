#ifndef START_GAME_STATE_H
#define START_GAME_STATE_H

#include "GameState.h"
#include "GuiImage.h"
#include <Singleton.h>

namespace Amju
{
// Initial Game State - show Logo
class GSLogo : public GameState, public NonCopyable
{
private:
  GSLogo();
  friend class Singleton<GSLogo>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();
  virtual void OnDeactive();

  // EventListener overrides - allow player to click through?
  virtual bool OnKeyEvent(const KeyEvent&);

private:
  float m_fade;

  // Logo image - TODO list of images ?
  GuiImage m_image;
};
typedef Singleton<GSLogo> TheGSLogo;
}

#endif
