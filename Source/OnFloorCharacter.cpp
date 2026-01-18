#include "OnFloorCharacter.h"
#include "BlinkCharacter.h"
#include "Floor.h"
#include <Timer.h>
#include <DegRad.h>

namespace Amju
{
OnFloorCharacter::OnFloorCharacter()
{
  m_dir = 0;
  m_dirCurrent = 0;
}

//AABB* OnFloorCharacter::GetAABB()
//{
//  Assert(m_pSceneNode);
//  return m_pSceneNode->GetAABB();
//}

//void OnFloorCharacter::SetDir(float degs)
//{
//  Assert(dynamic_cast<Animated*>(m_pSceneNode));
//  ((Animated*)m_pSceneNode)->SetDir(degs);
//}
//

void OnFloorCharacter::SetDir(float degs)
{
  m_dir = degs;
}

float OnFloorCharacter::GetDir() const
{
  return m_dir;
}

void OnFloorCharacter::SetAnim(const std::string& animName)
{
  Assert(dynamic_cast<Animated*>(m_pSceneNode));
  ((Animated*)m_pSceneNode)->SetAnim(animName);
}

void OnFloorCharacter::Update()
{
  OnFloor::Update();
  
  ///((BlinkCharacter*)m_pSceneNode)->UpdateAnim(this);

  Matrix mat;
  mat.RotateY(DegToRad(m_dirCurrent));
  mat.TranslateKeepRotation(m_pos);
  m_pSceneNode->SetLocalTransform(mat);

  static const float ROT_SPEED = 10.0f; // TODO CONFIG
  float dt = TheTimer::Instance()->GetDt();
  float angleDiff = m_dir - m_dirCurrent;
  
  // Rotate to face m_dir, taking the shortest route (CW or CCW)
  if (fabs(angleDiff) < 10.0f)
  {
    m_dirCurrent = m_dir;
  }
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

    if (m_dirCurrent > m_dir)
    {
      m_dirCurrent -= ROT_SPEED * dt * fabs(angleDiff);
    }
    else if (m_dirCurrent < m_dir)
    {
      m_dirCurrent += ROT_SPEED * dt * fabs(angleDiff);
    }
  }
}

void OnFloorCharacter::OnAnimFinished()
{
}

void OnFloorCharacter::OnAnimFreeze()
{
}

void OnFloorCharacter::OnAnimRepeat()
{
}

}
