#pragma once

#include "Trigger.h"

namespace Amju
{
// Intersecting a portal takes you to the portal destination - 
//  the position of another object in the current level, probably another
//  portal. 
class Portal : public Trigger
{
public:
  static const char* NAME;
  Portal();
  virtual WWGameObject* Clone() override;
  virtual const char* GetTypeName() const override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void OnPlayerCollision(Player*) override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

private:
  // ID of destination object, most likely another portal, so travel
  //  is 2 way.
  int m_destId;
};
}

