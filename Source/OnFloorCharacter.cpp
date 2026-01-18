#include <Timer.h>
#include <DegRad.h>
#include <ReportError.h>
#include "OnFloorCharacter.h"
#include "BlinkCharacter.h"
#include "Floor.h"

namespace Amju
{
OnFloorCharacter::OnFloorCharacter()
{
  m_dir = 0;
  m_dirCurrent = 0;
}

bool OnFloorCharacter::CreateSceneNode()
{
  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

  Assert(!m_md2Name.empty());
  Md2Model* model = (Md2Model*)TheResourceManager::Instance()->GetRes(m_md2Name);
  if (!model)
  {
    ReportError("Failed to load MD2: " + m_md2Name);
    return false;
  }

  bc->SetMd2(model);

  if (!bc->LoadTextures(m_texNames[0], m_texNames[1]))
  {
    ReportError("Failed to load character textures: " + m_texNames[0] + "/" + m_texNames[1]);
    return false;
  }

  bc->SetGameObj(this);

  return true;
}

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
  Assert(dynamic_cast<Animated*>(GetSceneNode()));
  ((Animated*)GetSceneNode())->SetAnim(animName);
}

void OnFloorCharacter::StopRotating()
{
  m_dir = m_dirCurrent;
}

void OnFloorCharacter::Update()
{
  OnFloor::Update();
  
  if (IsDead())
  {
    return;
  }

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
    // Fixed 27 Nov 2013
    if (angleDiff < -180.0f)
    {
//std::cout << "Angle diff: " << angleDiff << " m_dir: " << m_dir  << " m_dirCurrent: " << m_dirCurrent;
      m_dirCurrent -= 360.0f;
//std::cout << " -> " << m_dirCurrent << "\n";
    }
    else if (angleDiff > 180.0f)
    {
//std::cout << "Angle diff: " << angleDiff << " m_dir: " << m_dir  << " m_dirCurrent: " << m_dirCurrent;
      m_dirCurrent += 360.0f;
//std::cout << " -> " << m_dirCurrent << "\n";
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
