#pragma once

#include <ParticleEffect2d.h>
#include "WWGameObject.h"

namespace Amju
{
class FloaterParticleEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewPos() const override;
  virtual Vec3f NewVel() const override;
  virtual Vec3f NewAcc() const override;

  virtual void HandleDeadParticle(Particle2d*) override {}
  virtual void UpdateParticle(Particle2d*, float) override;
};

class Floaters : public WWGameObject
{
public:
  static const char* NAME;
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual bool Save(File* f) override;
  // Properties
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;
  virtual void Update() override;
 
private:
  virtual void CheckIfDead() override {} 
  virtual bool CreateSceneNode() override;

private:
  RCPtr<FloaterParticleEffect> m_effect;
};
}

