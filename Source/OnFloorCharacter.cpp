#include <Timer.h>
#include <DegRad.h>
#include <ReportError.h>
#include "OnFloorCharacter.h"
#include "BlinkCharacter.h"
#include "Floor.h"
#include "Describe.h"

namespace Amju
{
OnFloorCharacter::OnFloorCharacter()
{
  m_dir = 0;
  m_dirCurrent = 0;
  m_anim = -1;
  m_isTeleporting = false;
  m_teleportScale = 0;
}

bool OnFloorCharacter::CreateSceneNode()
{
  ResourceManager* rm = TheResourceManager::Instance();

  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

  Assert(!m_md2Name.empty());
  Md2Model* model = (Md2Model*)rm->GetRes(m_md2Name);
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

  m_cocoon = new SceneMesh;
  bc->AddChild(m_cocoon.GetPtr());
  ObjMesh* cocoonMesh = (ObjMesh*)rm->GetRes("ball.obj");
  m_cocoon->SetMesh(cocoonMesh);
  m_cocoon->SetVisible(false);

  return true;
}

void OnFloorCharacter::SetIsTeleporting(bool isTeleporting)
{
  m_cocoon->SetVisible(isTeleporting);
  m_isTeleporting = isTeleporting;
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
  Animated* a = dynamic_cast<Animated*>(GetSceneNode());
  Assert(a);
  int anim = a->GetMd2()->GetAnimationFromName(animName);
  if (anim != m_anim)
  {
    std::cout << Describe(this) << " anim: " << animName << "\n";
  }
  m_anim = anim;
  a->SetAnim(animName);
}

void OnFloorCharacter::StopRotating()
{
  m_dir = m_dirCurrent;
}

void OnFloorCharacter::UpdateCocoon()
{
  if (m_isTeleporting)
  {
    float dt = TheTimer::Instance()->GetDt();
    m_teleportScale += 0.01f * dt;

    Matrix tr;
    tr.Translate(Vec3f(0, 25, 0)); // move to half way up character - TODO per character type
    Matrix scale;
    scale.Scale(m_teleportScale, m_teleportScale, m_teleportScale);
    m_cocoon->SetLocalTransform(scale);
  }
}

void OnFloorCharacter::Update()
{
  OnFloor::Update();
  
  if (IsDead())
  {
    return;
  }

  UpdateCocoon();

  float dt = TheTimer::Instance()->GetDt();

  Matrix mat;
  mat.RotateY(DegToRad(m_dirCurrent));
  mat.TranslateKeepRotation(m_pos);
  m_pSceneNode->SetLocalTransform(mat);

  static const float ROT_SPEED = 10.0f; // TODO CONFIG
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
