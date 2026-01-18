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
  virtual WWGameObject* Clone() override;
  virtual const char* GetTypeName() const override;
  virtual bool Load(File*) override; 
  virtual bool Save(File*) override; 
  virtual void OnPlayerCollision(Player*) override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

private:
  std::string m_text;
  bool m_hasShownText;
};
}

#endif
