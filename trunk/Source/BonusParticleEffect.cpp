#include "BonusParticleEffect.h"

namespace Amju
{
static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

static const float PARTICLE_SPEED = 20.0f;

Vec3f BonusParticleEffect::NewVel() const
{
  return Vec3f(rnd(PARTICLE_SPEED), rnd(PARTICLE_SPEED), rnd(PARTICLE_SPEED));
}

Vec3f BonusParticleEffect::NewAcc() const
{
  return Vec3f(0, -PARTICLE_SPEED, 0); // gravity
}
}
