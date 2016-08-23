#pragma once

#include <GuiComposite.h>
#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSHiScores : public GSText
{
  GSHiScores();
  friend class Singleton<GSHiScores>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

private:
  enum Mode
  {
    HISCORE_MODE_SMOOTH_SCROLL,
    HISCORE_MODE_SCROLL_TO_TARGET,
    HISCORE_MODE_USER_SCROLL
  };
  Mode m_mode;
  
  // Number of score line to scroll to, or -1 to scroll smoothly from the top.
  // Zero-based, so 0 is the top score.
  int m_target;
  
  // Currently displayed score, which we want to increment until it reaches target
  int m_current;
  
  // Composite parent for all score lines
  GuiComposite* m_comp;
  
  int m_numScores;
};
typedef Singleton<GSHiScores> TheGSHiScores;
} // namespace

