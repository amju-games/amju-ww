#include <iostream>
#include <AmjuRand.h>
#include <Timer.h>
#include <DegRad.h>
#include <ReportError.h>
#include <Game.h>
#include <ROConfig.h>
#include "OnFloorCharacter.h"
#include "BlinkCharacter.h"
#include "Floor.h"
#include "Describe.h"
#include "MySceneGraph.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"
#include "PlayWav.h"
#include "ShadowManager.h"

//#define ANIM_DEBUG

namespace Amju
{
static const float MAX_BEING_EATEN_TIME = 6.0f;

// TODO Keep track of Pets with static container
void GetCharacters(Characters* characters)
{
  GameObjects* objs = TheGame::Instance()->GetGameObjects();
  for (GameObjects::iterator it = objs->begin(); it != objs->end(); ++it)
  {
    GameObject* go = it->second;
    OnFloorCharacter* p = dynamic_cast<OnFloorCharacter*>(go);
    if (p && !p->IsDead())
    {
      characters->push_back(p);
    }
  }
}

void OnFloorCharacter::AddPropertiesGui(PropertiesDialog* dlg) 
{
  // TODO change these to listbox items, as you have to choose from files in the glue file
  dlg->AddItem(new PropertiesDialog::FilenameItem("Md2", m_md2Name, PROP_MD2));
  // TODO create 2 names from one base name
  dlg->AddItem(new PropertiesDialog::FilenameItem("Texture", m_texNames[0], PROP_TEXTURE_1));
  dlg->AddItem(new PropertiesDialog::FilenameItem("Texture2", m_texNames[1], PROP_TEXTURE_2));
}

PropertyValue OnFloorCharacter::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }

  switch (key)
  {
  case PROP_MD2:
    return m_md2Name;
  case PROP_TEXTURE_1:
    return m_texNames[0];
  case PROP_TEXTURE_2:
    return m_texNames[1];
  }

  return OnFloor::GetProp(key);
}

void OnFloorCharacter::SetProp(PropertyKey key, PropertyValue value)
{
  switch (key)
  {
  case PROP_MD2:
    m_md2Name = value.GetString();
    break;
  case PROP_TEXTURE_1:
    m_texNames[0] = value.GetString();
    break;
  case PROP_TEXTURE_2:
    m_texNames[1] = value.GetString();
    break;
  }

  OnFloor::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

OnFloorCharacter::OnFloorCharacter()
{
  m_dir = 0;
  m_dirCurrent = 0;
  m_anim = -1;
  m_isTeleporting = false;
  m_teleportScale = 0;
  m_eatenState = NOT_EATEN_YET;
  m_eatenTime = 0;
  m_bloodPoolScale = 0;
  m_isInvincible = false;
  m_velMult = 1;
}

void OnFloorCharacter::SetInvincible(bool b)
{
  m_isInvincible = b;
}

bool OnFloorCharacter::IsInvincible() const
{
  return m_isInvincible;
}

void OnFloorCharacter::SetVelMult(float velMult)
{
  m_velMult = velMult;
}

void OnFloorCharacter::AddToGame() 
{
  OnFloor::AddToGame();

  // Blood particle effect for when pet eaten
  m_bloodFx = new BloodFx;
  // Tex, size, num, time
  m_bloodFx->Set("gore.png", 2, 100, 2.0f, 0); // TODO CONFIG

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(m_bloodFx.GetPtr());

  // Create blood pool scene node
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes("blood_pool.obj");
  Assert(mesh);
  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);

  // Bad idea!
  // will give better visuals? - no, can cause blood pool to be 
  //  hidden by things drawn after 
  //sm->SetIsZWriteEnabled(false); 

  m_bloodPool = sm;
  root->AddChild(sm);
  m_bloodPool->SetVisible(false);
}

void OnFloorCharacter::ResetEatenState() 
{
  m_eatenState = NOT_EATEN_YET;
}

void OnFloorCharacter::UpdateBloodPoolRotation()
{
  Floor* floor = const_cast<Floor*>(GetFloor());
  if (floor)
  {
    m_floorRot = *(floor->GetMatrix()); 
    m_floorRot.TranslateKeepRotation(Vec3f()); // just the rotation
    m_floorRot = m_invFloorMatrix * m_floorRot; // rotation relative to when blood pool created
  }
}

void OnFloorCharacter::CalcBloodPoolMatrix()
{
  // Just do this once for static floors.
  Floor* floor = const_cast<Floor*>(GetFloor());
  // If we are on a static floor, get triangles under the blood pool, as
  //  floor might be a funny shape. Get a rough rotation matrix from the
  //  tris.
  CollisionMesh* cm = floor->GetCollisionMesh();
  CollisionMesh::Tris tris;
  // May need to extend box downwards?
  cm->GetAllTrisInBox(m_aabb, &tris);
     
  Vec3f normal(0, 1, 0); // normal to surface here, must point up, roughly.
  Matrix mat; // identity if normal is (0, 1, 0)
  if (tris.empty())
  {
std::cout << "Bah, no tris for blood pool.\n";
  }
  else
  {
    // Average all tri normals which face up
    int s = tris.size();
    for (int i = 0; i < s; i++)
    {
      Vec3f n = tris[i].CalcNormal(); // was tris[0] ?!??
      if (n.y > 0)
      {
        normal += n;
      }
    }
    normal.Normalise();
    // Get matrix which rotates (0, 1, 0) to this normal
    Vec3f forward(0, 0, 1);
    Vec3f right = CrossProduct(forward, normal);
    forward = CrossProduct(right, normal);

    // Ideally something like this:
    //Matrix3x3 rot(right, normal, forward);
    //mat.Set3x3(rot);
    mat[0]  = right.x;
    mat[1]  = right.y;
    mat[2]  = right.z;
    mat[4]  = normal.x;
    mat[5]  = normal.y;
    mat[6]  = normal.z;
    mat[8]  = forward.x;
    mat[9]  = forward.y;
    mat[10] = forward.z;
  }

  m_bloodPoolMatrix = mat;
  m_invFloorMatrix = *(floor->GetMatrix());
  // Just the rotation
  m_invFloorMatrix.TranslateKeepRotation(Vec3f());
  m_invFloorMatrix = Transpose(m_invFloorMatrix); // inverse
}

void OnFloorCharacter::StartBeingEaten(OnFloorCharacter* eater)
{
  // Is only called once per pet
  Assert(m_eatenState == NOT_EATEN_YET);
//  Assert(!m_justDropped);

  Amju::PlayWav("goopy");

  SetAnim("eaten"); // once state is BEING_EATEN, we can't change anim
  m_eatenState = BEING_EATEN;

  float dir = eater->GetDir();
  Matrix mat;
  mat.RotateY(DegToRad(dir));
  Vec3f pos = eater->GetPos();
  mat.TranslateKeepRotation(pos);
  GetSceneNode()->SetLocalTransform(mat);

  m_bloodFx->SetMinY(GetPos().y);
  m_bloodFx->SetDino(eater);
  m_bloodFx->Start();

  // Make sure it's not culled
  m_bloodFx->SetAABB(*GetSceneNode()->GetAABB());

  StartBloodEffect();

  // We will be dead after 3 secs
#ifdef _DEBUG
std::cout << Describe(this) << " just got eaten, setting death timer.\n";
#endif

  m_deathTimer = 3.0f;
}

void OnFloorCharacter::StartBloodEffect()
{
  m_bloodPoolPos = m_pos;
  // Get accurate y
/* no good!?
  Floor* floor = const_cast<Floor*>(GetFloor());
  CollisionMesh* cm = floor->GetCollisionMesh();
  cm->GetY(Vec2f(m_bloodPoolPos.x, m_bloodPoolPos.z), &m_bloodPoolPos.y);
*/
  Matrix mat;
  mat.Translate(GetPos());
  mat.Scale(0, 1, 0); // start size 0 in (x, z)
  m_bloodPool->SetLocalTransform(mat);
  m_bloodPool->SetAABB(*(GetSceneNode()->GetAABB()));
  m_bloodPool->SetVisible(true);
  m_bloodPoolXZSize = Vec2f(1.5f + Rnd(0, 1.0f), 1.5f + Rnd(0, 1.0f));

  CalcBloodPoolMatrix();

  // Remove from ShadowManager
  TheShadowManager::Instance()->RemoveCaster(this);
}

bool OnFloorCharacter::CanBeEaten() const
{
  bool b = 
    !IsInvincible() && 
    (m_eatenState == NOT_EATEN_YET) && 
    !IsDead() &&
    !IsFalling();

  return b;
}

bool OnFloorCharacter::CreateSceneNode()
{
  ResourceManager* rm = TheResourceManager::Instance();

  BlinkCharacter* bc = new BlinkCharacter;
  SetSceneNode(bc);

  Assert(!m_md2Name.empty());
  Md2Model* model = (Md2Model*)rm->GetRes(m_md2Name);
  if (!model)
  {
    ReportError("Failed to load MD2: " + m_md2Name);
    return false;
  }

  Md2Model::Animation anim = model->GetAnimationFromName("eaten");
  if (anim != -1)
  {
    model->SetDoesFreeze(anim, true);
  }

  bc->SetMd2(model);

  if (!bc->LoadTextures(m_texNames[0], m_texNames[1]))
  {
    ReportError("Failed to load character textures: " + m_texNames[0] + "/" + m_texNames[1]);
    return false;
  }

  bc->SetGameObj(this);
  bc->SetIsLit(false); // no lighting for MD2s

  m_cocoon = new SceneMesh;
  ObjMesh* cocoonMesh = (ObjMesh*)rm->GetRes("ball.obj");
  m_cocoon->SetMesh(cocoonMesh);
  // Or Add to scene later?
  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->AddChild(m_cocoon.GetPtr());
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
  if (m_eatenState != NOT_EATEN_YET)
  {
std::cout << "Anim: " << Describe(this) << " anim " << animName <<
  " ignored as we are eaten!\n";
    return;
  }

  Animated* a = dynamic_cast<Animated*>(GetSceneNode());
  Assert(a);
  int anim = a->GetMd2()->GetAnimationFromName(animName);
#ifdef ANIM_DEBUG
  if (anim != m_anim)
  {
    std::cout << Describe(this) << " anim: " << animName << "\n";
  }
#endif
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
    const float SCALE_MULT = 1.0f;
    m_teleportScale += SCALE_MULT * dt;

    Matrix tr;
    tr.Translate(m_pos + Vec3f(0, 25, 0)); // move to half way up character - TODO per character type
//std::cout << "Teleport: cocoon pos: " << Describe(m_pos) << "\n";

    Matrix scale;
    const float XZ_SCALE = 0.01f / m_teleportScale; // TEST 0.1f; // TODO CONFIG
    scale.Scale(XZ_SCALE, m_teleportScale, XZ_SCALE);
    m_cocoon->SetLocalTransform(scale * tr);
    m_cocoon->SetAABB(m_aabb);
  }
}

void OnFloorCharacter::Update()
{
  m_vel.x *= m_velMult;
  m_vel.z *= m_velMult;

  OnFloor::Update();

  m_vel.x /= m_velMult; // TODO only if flag set
  m_vel.z /= m_velMult;
 
#ifdef FALLING_DEBUG
  if (IsFalling())
  {
    GetSceneNode()->SetColour(Colour(0, 0, 1, 1));
  }
  else
  {
    GetSceneNode()->SetColour(Colour(1, 1, 1, 1));
  }
#endif
 
  if (IsDead())
  {
    return;
  }

  UpdateCocoon();

  float dt = TheTimer::Instance()->GetDt();

  Matrix mat;
  mat.RotateY(DegToRad(m_dirCurrent));
  mat.TranslateKeepRotation(m_pos);
  GetSceneNode()->SetLocalTransform(mat);

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

  if (m_eatenState == BEING_EATEN)
  {
    m_eatenTime += dt;

    if (m_eatenTime > MAX_BEING_EATEN_TIME)
    {
      m_eatenState = HAS_BEEN_EATEN;
      // TODO Fade 
      //m_bloodPool->SetVisible(false);
    }
  }

  if (m_eatenState == BEING_EATEN || m_eatenState == HAS_BEEN_EATEN)
  {
    // Increase blood pool size
    static const float MAX_BP_SCALE = ROConfig()->GetFloat("pet-bloodpool-max-scale");
    if (m_bloodPoolScale < MAX_BP_SCALE)
    {
      m_bloodPoolScale += dt; 
    }
    Vec3f s(m_bloodPoolXZSize.x * m_bloodPoolScale, 
            1.0f,
            m_bloodPoolXZSize.y * m_bloodPoolScale);

    // Rotate by floor rotation every frame if on a tilting floor
    UpdateBloodPoolRotation();

    Matrix mat; 
    mat.Scale(s.x, 1.0f, s.z);
    mat *= m_bloodPoolMatrix; // rotation due to floor shape
    mat.TranslateKeepRotation(m_bloodPoolPos); 


    // Only required if floor can tilt
    // Rotate by rotation of floor, around the floor centre
    Matrix tr1;
    tr1.Translate(-m_floor->GetPos());
    Matrix tr2;
    tr2.Translate( m_floor->GetPos());
    Matrix floorRot = tr1 * m_floorRot * tr2;
    mat *= floorRot;

    m_bloodPool->SetLocalTransform(mat);
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
