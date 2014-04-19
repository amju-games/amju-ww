#ifndef FENCE_H
#define FENCE_H

#include "WWGameObject.h"

namespace Amju
{
// Could have a fence on a Floor?? Treat this differently ??
// (Nasty because we won't be dealing with AABBs any more)
// For now, this kind of fence doesn't move -- or, in particular,
//  it doesn't rotate.
class Fence : public WWGameObject
{
public:
  static const char* NAME;

  Fence();

  // GameObject overrides
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void Update() override;
  virtual void Reset() override;
  virtual bool CreateSceneNode() override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

};
}

#endif
