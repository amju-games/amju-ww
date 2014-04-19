#pragma once

#include "ParticleEffect2d.h"

namespace Amju
{
class OnFloorCharacter;

class BloodFx : public ParticleEffect2d
{
public:
  BloodFx();

  virtual Vec3f NewPos() const override;
  virtual Vec3f NewVel() const override;
  virtual Vec3f NewAcc() const override;
  virtual float NewTime() const override;
  virtual void HandleDeadParticle(Particle2d* p) override;
  virtual void HandleMinY(Particle2d* p) override;

  void SetDino(OnFloorCharacter* d) { m_dino = d; }

private:
  OnFloorCharacter* m_dino;
};

}

