#include "OnFloorCharacter.h"
#include "BlinkCharacter.h"
#include "Floor.h"

namespace Amju
{
OnFloorCharacter::OnFloorCharacter()
{
}

//AABB* OnFloorCharacter::GetAABB()
//{
//  Assert(m_pSceneNode);
//  return m_pSceneNode->GetAABB();
//}

void OnFloorCharacter::SetDir(float degs)
{
  ((BlinkCharacter*)m_pSceneNode)->SetDir(degs);
}

void OnFloorCharacter::Update()
{
  OnFloor::Update();
  ((BlinkCharacter*)m_pSceneNode)->UpdateAnim(this);
  Matrix mat;
  mat.Translate(m_pos);
  m_pSceneNode->SetLocalTransform(mat);
}
}
