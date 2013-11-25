#include <DegRad.h>
#include "BloodFx.h"
#include "Dino.h"

namespace Amju
{
const float BLOOD_GRAVITY = -150.0f;
static const float PARTICLE_SPEED = 60.0f;

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

BloodFx::BloodFx() : m_dino(0)
{
}

Vec3f BloodFx::NewPos() const
{
  // Origin should be at mouth, which depends on dino size
  float d = 30.0f; // TODO TEMP TEST
  float y = 35.0f;
  float rad = DegToRad(m_dino->GetDir());
  float x = sin(rad); // flipping sin/cos to match atan2 call in AIChasePet
  float z = cos(rad);

//std::cout << "Dino heading: " << m_dino->GetDir() << " x: " << x << " z: " << z << "\n";

  x *= d;
  z *= d;
  return m_dino->GetPos() + Vec3f(x, y, z);
}

Vec3f BloodFx::NewVel() const
{
//  return Vec3f(0, 0, 0); // to test origin

  // TODO Tend to jet out sideways from mouth, so perpendicular to
  //  dino heading, with some random variation.
  // Sometimes just go anywhere.
  float rad = DegToRad(m_dino->GetDir() + 90.0f + rnd(30.0f));
  float x = sin(rad); // opposite sin/cos to NewPos()
  float z = cos(rad);
  if ((rand() & 1) == 1)
  {
    x = -x;
    z = -z;
  }
  return Vec3f(
    x * (PARTICLE_SPEED + rnd(PARTICLE_SPEED) * 0.75),
    0,
    z * (PARTICLE_SPEED + rnd(PARTICLE_SPEED) * 0.75) );
}

float BloodFx::NewTime() const
{
  return 0; // was: (float)rand() / (float)RAND_MAX * 5.0f;
}

Vec3f BloodFx::NewAcc() const
{
//  return Vec3f(0, 0, 0); // to test origin
  return Vec3f(0, BLOOD_GRAVITY, 0);
}

void BloodFx::HandleMinY(Particle2d* p)
{
  // Make sure we are above ground
  static const float OFFSET = 1.0f;
  p->m_pos.y = m_dino->GetPos().y + OFFSET;
  p->m_vel = Vec3f(0, 0, 0);
  p->m_acc = Vec3f(0, 0, 0);
}

void BloodFx::HandleDeadParticle(Particle2d* p)
{
//  Recycle(p); // for testing
}

}

