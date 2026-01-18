#ifndef TUTORIAL_TRIGGER_H
#define TUTORIAL_TRIGGER_H

#include <string>
#include "Trigger.h"

namespace Amju
{
class TutorialTrigger : public Trigger
{
public:
  static const char* NAME;
  TutorialTrigger();
  virtual const char* GetTypeName() const;
  virtual bool Load(File*); 
  virtual bool Save(File*); 
  virtual void OnPlayerCollision(Player*);

private:
  std::string m_text;
  bool m_hasShownText;
};
}

#endif
