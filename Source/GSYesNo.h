#ifndef GS_YESNO_H_INCLUDED
#define GS_YESNO_H_INCLUDED

#include "GSText.h"

namespace Amju 
{
class GSYesNo : public GSText
{
public:
  GSYesNo();
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

  virtual void OnYes() = 0;
  virtual void OnNo() { GoBack(); } 

protected:
  std::string m_question;
  std::string m_yesText;
  std::string m_noText;

  // If true, yes button has red highlight to show non-undoable action.
  // If false, no button has the red highlight.
  bool m_yesRed;
};
} // namespace
#endif
