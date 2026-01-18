#include "AmjuFirst.h"
#include "Animated.h"
#include "Timer.h"
#include "AmjuGL.h"
#include "Sign.h"
#include "AmjuFinal.h"

namespace Amju
{
Animated::Animated()
{
  m_dir = 0;
  m_dirCurrent = 0;
  m_oldAngleDiff = 0;

  m_frame = 0;
  m_nextFrame = 1;
  m_t = 0;
  m_anim = 0;

  m_isControlled = false;
}

bool Animated::IsControlled() const
{
  return m_isControlled;
}

void Animated::SetIsControlled(bool b)
{
  m_isControlled = b;
}

bool Animated::IsFalling() const
{
  return m_isFalling;
}

void Animated::SetIsFalling(bool b)
{
  m_isFalling = b;
}

void Animated::SetDir(float degs)
{
  m_dir = degs;
}

void Animated::SetAnim(int anim)
{
  if (anim == m_anim)
  {
    return;
  }

  m_anim = anim;
  // Blend into first frame of new anim
  m_nextFrame = m_pModel->GetStartFrame(m_anim);
}

void Animated::Draw()
{
  Assert(m_pModel);

  float t = m_t * 10.0f;
  if (t > 1.0f)
  {
    t = 1.0f;
  }
  AmjuGL::PushMatrix();
  // Offset Y so feet are at zero
  AmjuGL::Translate(m_pos.x, m_pos.y + 30.0f, m_pos.z);
  AmjuGL::RotateY(m_dirCurrent);
  m_pModel->DrawFrames(m_frame, m_nextFrame, t);
  AmjuGL::PopMatrix();
}

void Animated::Update()
{
  GameObject::Update();

  static const float ROT_SPEED = 10.0f; // TODO CONFIG
  float dt = TheTimer::Instance()->GetDt();
  float angleDiff = m_dir - m_dirCurrent;
  
  
  if (fabs(angleDiff) < 10.0f)
  {
    m_dirCurrent = m_dir;
  }
  /*
  else if (angleDiff < -180.0f)
  {
    angleDiff += 360.0f;
  }
  else if (angleDiff > 180.0f)
  {
    angleDiff -= 360.0f;
  }
  

  if (angleDiff > 0 && m_oldAngleDiff < 0 ||
      angleDiff < 0 && m_oldAngleDiff > 0 )
  {
    m_dirCurrent = m_dir;
  }
  */

  else
  {
    if (angleDiff < -180.0f)
    {
      m_dir += 360.0f;
    }
    else if (angleDiff > 180.0f)
    {
      m_dir -= 360.0f;
    }
    angleDiff = m_dir - m_dirCurrent;
//    Assert(angleDiff >= -180.0f);
//    Assert(angleDiff <= 180.0f);

    if (m_dirCurrent > m_dir)
    {
      m_dirCurrent -= ROT_SPEED * dt * fabs(angleDiff);
    }
    else if (m_dirCurrent < m_dir)
    {
      m_dirCurrent += ROT_SPEED * dt * fabs(angleDiff);
    }
  }
  //m_oldAngleDiff = angleDiff;

  /*
  if (fabs(d) > 5.0f) // TODO CONFIG
  {
    // Reduce difference between m_dirCurrent and m_dir
    d *= 0.9f; // TODO CONFIG
    m_dirCurrent = m_dir - d;
  }
  */

  Assert(m_pModel);
  m_t += dt;

  if (m_t > 0.1f) // MD2 frames are 0.1 secs each 
  {
    m_t = 0;
    m_frame = m_nextFrame;

    int startFrame = m_pModel->GetStartFrame(m_anim);
    int size = m_pModel->GetAnimationSize((Md2Model::Animation)m_anim);

    // If next frame is in the same animation, increment to next frame,
    //  or go back to first frame
    if (m_nextFrame >= startFrame && m_nextFrame <= startFrame + size)
    {
      m_nextFrame++;
      if (m_nextFrame >= startFrame + size)
      {
        m_nextFrame = startFrame;
      }
    }
  }
}
}
