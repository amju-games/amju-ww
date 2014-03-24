#include <File.h>
#include <Game.h>
#include <DegRad.h>
#include <StringUtils.h>
#include <LoadScene.h>
#include <ROConfig.h>
#include "WWGameObject.h"
#include "MySceneGraph.h"
#include "ShadowManager.h"
#include "Describe.h"
#include "PropertyKeys.h"
#include "GameMode.h"
#include "Depth.h"

namespace Amju
{
WWGameObject::WWGameObject()
{
  m_isDead = false;
  m_pSceneNode = 0;
  m_extentsSet = false;
  m_extentsYOffset = 0;
  m_shadowSize = 0;
  m_yRot = 0;
}
 
void WWGameObject::SetSelected(bool selected)
{
  m_editModeIsSelected = selected;
  Assert(IsEditMode());
  // Set flag on extra scene node
  Assert(m_selNode);
  m_selNode->SetSel(selected);
}

bool WWGameObject::IsSelected() const
{
  return m_editModeIsSelected;
}

void WWGameObject::AddToGame()
{
  if (!m_shadowTexName.empty())
  {
    TheShadowManager::Instance()->AddCaster(this, m_shadowSize, m_shadowTexName);
  }
  TheGame::Instance()->AddGameObject(this);

  CreateSceneNode(); 
  if (GetSceneNode())
  {
    AddSceneNodeToGraph();
  }
}

void WWGameObject::RemoveFromGame()
{
  if (!m_shadowTexName.empty())
  {
    TheShadowManager::Instance()->RemoveCaster(this);
  }

  TheGame::Instance()->EraseGameObject(GetId());

  // TODO Fix for edit mode
  RemoveSceneNodeFromGraph();
}

void WWGameObject::Reset() 
{
  SetDead(false);
  SetPos(m_startPos);
  SetVel(Vec3f());
  RecalcAABB();
  SceneNode* sn = GetSceneNode();
  if (sn)
  {
    Matrix mat;
    mat.Translate(m_startPos);
    sn->SetLocalTransform(mat);
  }
}

PropertyValue WWGameObject::GetProp(PropertyKey key)
{
  switch (key)
  {
  case PROP_MESH:
    return m_meshFilename;
  }
  return PropertyValue();
}

void WWGameObject::SetProp(PropertyKey key, PropertyValue value)
{
  switch (key)
  {
  case PROP_MESH:
    m_meshFilename = StripPath(value.GetString()); // obj files in Glue file are in top level dir
  }
}

void WWGameObject::Move(const Vec3f& move)
{
  Vec3f p = GetPos();
  p += move;
  m_startPos = p;
  SetPos(p);

  m_aabb.Translate(move);

  SceneNode* sn = GetSceneNode();
  Assert(sn);
  sn->SetAABB(m_aabb);
  Matrix mat;
  mat.Translate(move);
  sn->MultLocalTransform(mat);
}

void WWGameObject::RotateY(float angleDegs)
{
  m_yRot += angleDegs;
  float rads = DegToRad(angleDegs);
  Matrix mat;
  mat.RotateY(rads);

  SceneNode* sn = GetSceneNode();
  Assert(sn);
  Matrix m2 = sn->GetLocalTransform();
  Matrix inv = m2;
  inv.Inverse();
  mat = mat * m2;
  sn->SetLocalTransform(mat);

  m_aabb.Transform(inv);
  m_aabb.Transform(mat); 
  sn->SetAABB(m_aabb);
}

void WWGameObject::SetSceneNode(RCPtr<SceneNode> node)
{
  m_pSceneNode = node;
}

bool WWGameObject::CreateSceneNode()
{
  PSceneNode sn = LoadScene(m_meshFilename);
/*
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(m_meshFilename);
  if (!mesh) 
  {
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
*/

  SetSceneNode(sn);

  // Set bounding box
  RecalcAABB();

  return true;
}

bool WWGameObject::LoadMeshResource(File* f)
{
  if (!f->GetDataLine(&m_meshFilename))
  {
    f->ReportError("Expected mesh file name");
    return false;
  }
 
  std::string ext = GetFileExt(m_meshFilename);
  //if (ext != "obj")
  //{
  //  f->ReportError("Not an .obj file?!\n");
  //  return false;
  //}
  // TODO verify file exists?

  return true;
}

bool WWGameObject::SaveMeshResource(File* f)
{
  if (m_meshFilename.empty()) 
  {
    f->ReportError("No mesh filename for " + Describe(this));
    return false;
  }
  f->WriteComment("// Mesh filename");
  return f->Write(m_meshFilename);
}

bool WWGameObject::SaveShadow(File* f)
{
  if (m_shadowTexName.empty()) 
  {
    f->ReportError("No shadow texture name for " + Describe(this));
    return false;
  }
  f->WriteComment("// Shadow texture & size");
  return f->Write(m_shadowTexName) && f->WriteFloat(m_shadowSize);
}

bool WWGameObject::LoadShadow(File* f)
{
  if (!f->GetDataLine(&m_shadowTexName))
  {
    f->ReportError("Expected shadow texture resource name");
    return false;
  }

  if (!f->GetFloat(&m_shadowSize))
  {
    f->ReportError("Expected shadow size");
    return false;
  }

  return true;
}

SceneNode* WWGameObject::GetSceneNode()
{
  return m_pSceneNode;
}

void WWGameObject::RemoveSceneNodeFromGraph()
{
  SceneNode* sn = GetSceneNode();
  if (sn)
  {
    SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
    Assert(root);

    if (IsEditMode())
    {
      root->DelChild(m_selNode.GetPtr());
    }
    else
    {
      root->DelChild(sn);
    }
  }

}

void WWGameObject::AddSceneNodeToGraph()
{
  Assert(m_pSceneNode);

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);

  if (IsEditMode())
  {
    m_selNode = new SelectedNode;
    m_selNode->AddChild(m_pSceneNode);

    root->AddChild(m_selNode.GetPtr());
  }
  else
  {
    root->AddChild(m_pSceneNode);
  }
}

void WWGameObject::SetDead(bool dead)
{
  m_isDead = dead;
}

bool WWGameObject::IsDead() const
{
  return m_isDead;
}

void WWGameObject::RecalcAABB()
{
  if (m_extentsSet)
  {
    m_aabb = AABB(
      m_pos.x - m_aabbExtents.x, m_pos.x + m_aabbExtents.x,
      m_pos.y - m_aabbExtents.y + m_extentsYOffset, m_pos.y + m_aabbExtents.y + m_extentsYOffset,
      m_pos.z - m_aabbExtents.z, m_pos.z + m_aabbExtents.z);
  }

  if (m_pSceneNode)
  {
    m_pSceneNode->SetAABB(m_aabb);
  }
}

void WWGameObject::Update() 
{
  GameObject::Update();
  CheckIfDead();
}

void WWGameObject::CheckIfDead()
{
  // If an object goes too far off the top of the screen, mark it as dead, so
  //  we can delete it.
  // TODO TEMP TEST
  static const float MAX_OFFSCREEN_HEIGHT = ROConfig()->GetFloat("max-offscreen-height");
  float cd = GetCurrentDepth();
  float h = cd + m_pos.y;
  if (h > MAX_OFFSCREEN_HEIGHT)
  {
std::cout << "Object " << Describe(this) << " has scrolled off, is dead: ";
std::cout << "cd: " << cd << "y: " << m_pos.y << " h: " << h << "\n";
    SetDead(true);
  }
  if (h < -1000) // TODO TEMP TEST
  {
std::cout << "Object " << Describe(this) << " has fallen off world, is dead: ";
std::cout << "cd: " << cd << "y: " << m_pos.y << " h: " << h << "\n";
    SetDead(true);
  }
}

}
