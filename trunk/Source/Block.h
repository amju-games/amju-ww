#ifndef BLOCK_H
#define BLOCK_H

#include "OnFloor.h"
#include "Matrix.h"

namespace Amju
{
class SceneMesh;

class Block : public OnFloor
{
public:
  static const char* NAME;

  Block();
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File* f) override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);
};
}

#endif

