#ifndef SKYBOX_H
#define SKYBOX_H

#include "WWGameObject.h"
#include "EventListener.h"
#include "ObjMesh.h"

namespace Amju
{
class SceneMesh;

class Skybox : public WWGameObject
{
public:
  static const char* NAME;

  Skybox();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Update();
  virtual void AddToGame() override;
  //virtual bool CreateSceneNode() override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;
  virtual bool YesAddToLevel(int, float) { Assert(0); return false; }

private:
  Colour m_colour;
};
}

#endif
