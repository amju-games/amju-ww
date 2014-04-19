#ifndef BONUS_PARTICLE_EFFECT_H
#define BONUS_PARTICLE_EFFECT_H

#include "ParticleEffect2d.h"

namespace Amju
{
class BonusParticleEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewVel() const override;
  virtual Vec3f NewAcc() const override;
};
}

#endif

