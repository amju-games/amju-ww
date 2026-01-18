#ifndef STATIC_FLOOR_H
#define STATIC_FLOOR_H

#include "Floor.h"

namespace Amju
{
class StaticFloor : public Floor
{
public:
  static const char* NAME;
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;

  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
};
}

#endif
