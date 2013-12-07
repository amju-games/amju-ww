#include <AmjuRand.h>
#include "BonusParticleEffect.h"

namespace Amju
{
static const float PARTICLE_SPEED = 40.0f;
static const float PARTICLE_GRAV = -10.0f;

Vec3f BonusParticleEffect::NewVel() const
{
  return Vec3f(Rnd(-PARTICLE_SPEED, PARTICLE_SPEED), Rnd(0, PARTICLE_SPEED), Rnd(-PARTICLE_SPEED, PARTICLE_SPEED));
}

Vec3f BonusParticleEffect::NewAcc() const
{
  return Vec3f(0, PARTICLE_GRAV, 0); // gravity
}
}
