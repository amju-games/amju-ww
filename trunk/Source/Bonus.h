#ifndef BONUS_H
#define BONUS_H

#include "OnFloor.h"
#include "BonusParticleEffect.h"

namespace Amju
{
class Player;

// Float in the air - don't move with any floor, but do cast a shadow
class Bonus : public OnFloor
{
public:
  static const char* NAME;

  Bonus();
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*) override;
  virtual bool Save(File* f) override;
  virtual void Update() override; // NB Don't move with floor!
  virtual bool CreateSceneNode() override;
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);

  virtual bool YesAddToLevel(int levelId, float depth) override; 
  virtual void Customise(int levelId, float depth) override;

  void OnPlayerCollision(Player*);

protected:
  bool m_isCollected;
  BonusParticleEffect* m_effect; 
  int m_points;
  int m_lives;
};
}

#endif

