#include "AmjuFirst.h"
#include "Animated.h"
#include "Timer.h"
#include "AmjuGL.h"
#include "Sign.h"
#include "ResourceManager.h"
#include "ReportError.h"
#include "DrawAABB.h"
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
}

void Animated::SetDir(float degs)
{
  m_dir = degs;
}

float Animated::GetDir() const
{
  return m_dir;
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

bool Animated::LoadMd2(const std::string& md2name)
{
  m_pModel = (Md2Model*)TheResourceManager::Instance()->GetRes(md2name);
  if (!m_pModel)
  {
    ReportError("Failed to load MD2: " + md2name);
    return false;
  }
  return true;
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
  AmjuGL::MultMatrix(m_local);
  // TODO Offset Y so feet are at zero
  AmjuGL::Translate(0, 30.0f, 0);
//  AmjuGL::Translate(m_pos.x, m_pos.y + 30.0f, m_pos.z);
  AmjuGL::RotateY(m_dirCurrent); // incorporate rotation into matrix ?
  m_pModel->DrawFrames(m_frame, m_nextFrame, t);
  AmjuGL::PopMatrix();

  DrawAABB(*GetAABB());
}

void Animated::Update()
{
  SceneNode::Update();

  static const float ROT_SPEED = 10.0f; // TODO CONFIG
  float dt = TheTimer::Instance()->GetDt();
  float angleDiff = m_dir - m_dirCurrent;
  
  // TODO Rotate to face m_dir, taking the shortest route (CW or CCW)
  //  This is a mess ATM
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
