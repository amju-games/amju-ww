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

  void OnPlayerCollision(Player*);

protected:
  bool m_isCollected;
  float m_yRot;
  BonusParticleEffect* m_effect; 
  int m_points;
  int m_lives;
};
}

#endif

