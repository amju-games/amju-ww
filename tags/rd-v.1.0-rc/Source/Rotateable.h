#ifndef ROTATEABLE_H
#define ROTATEABLE_H

namespace Amju
{
  class Rotateable
  {
  public:
    Rotateable();
    void Update();

  protected:
    // Accumulated rotation
    Quaternion m_quat;

    // TODO Quats for angular velocity and torque ???

    // Current rotational velocity is about this axis
    Vec3f m_rotAxis;

    // Current rotational speed, degs/sec
    float m_rotSpeed;
  };
}

#endif
