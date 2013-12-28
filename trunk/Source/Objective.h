#ifndef OBJECTIVE_H
#define OBJECTIVE_H

#include <string>
#include "WWGameObject.h"

namespace Amju
{
// Base class for the Objective for a balance game level
// This impl checks for all dead dinos 
// Subclasses can search for level-specific objectives
class Objective : public WWGameObject
{
public:
  static const char* NAME;

  Objective();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Update();
  virtual void Reset();
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);

protected:
  // Called by Update() when we have completed the objective for the level
  void ObjectiveComplete();

protected:
  bool m_isComplete;
  std::string m_text;
};
}

#endif
