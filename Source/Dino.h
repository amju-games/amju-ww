#ifndef DINO_H
#define DINO_H

#include "Npc.h"
#include "ParticleEffect2d.h"

namespace Amju
{
class Pet;
class Dino;

class BloodFx : public ParticleEffect2d
{
public:
  BloodFx(Dino*);

  virtual Vec3f NewPos() const;
  virtual Vec3f NewVel() const;
  virtual Vec3f NewAcc() const;
  virtual float NewTime() const;
  virtual void HandleDeadParticle(Particle2d* p);

private:
  Dino* m_dino;
};

class Dino : public Npc
{
public:
  static const char* NAME;

  Dino();
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;

  void Eat(Pet*);
  bool IsEating() const;
  void StartBloodEffect();

protected:
  // Dinos have big heads so AABB is not symmetrical
  void UpdateAabb();

protected:
  enum DinoType { AMJU_DINO_GREEN, AMJU_DINO_BLUE, AMJU_DINO_RED };
  DinoType m_dinoType;

  RCPtr<BloodFx> m_bloodFx;
};
}

#endif
