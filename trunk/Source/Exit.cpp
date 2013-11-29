#include "Exit.h"
#include "Game.h"
#include "GSLevelComplete.h"
#include "LoadMeshResource.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "Timer.h"
#include "DegRad.h"
#include "Colour.h"
#include "GSMain.h"
#include "TextMaker.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include <StringUtils.h>
#include <DegRad.h>
#include "LevelManager.h"

namespace Amju
{
GameObject* CreateExit() { return new Exit; }
static bool reg = TheGameObjectFactory::Instance()->Add(Exit::NAME, &CreateExit);

const char* Exit::NAME = "exit";

static const float XSIZE = 20.0f;
static const float YSIZE = 20.0f;

Exit::Exit()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;

  m_isActive = false;
  m_activeTime = 0;
  m_rotate = 0;
  m_toLevel = 0;
  m_isExiting = false;
}

WWGameObject* Exit::Clone() 
{
  return new Exit(*this);
}

const char* Exit::GetTypeName() const
{
  return NAME;
}

void Exit::AddToGame() 
{
  StaticFloor::AddToGame();

  Assert(m_text);
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->AddChild(m_text);
  root->AddChild(m_cylinder);
}

void Exit::RemoveFromGame() 
{
  StaticFloor::RemoveFromGame();

  Assert(m_text);
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->DelChild(m_text);
  root->DelChild(m_cylinder);
}

void Exit::Reset()
{
  StaticFloor::Reset();
 
  m_isActive = false;
  m_isExiting = false;
}

void Exit::Update()
{
  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 3.0f;
  m_rotate += ROT_SPEED * dt;

  Matrix mat;
  mat.RotateY(m_rotate);
  mat.TranslateKeepRotation(m_pos);

  // TODO Inner mesh
//  m_pSceneNode->SetLocalTransform(mat);

  if (m_isExiting)
  {
    m_activeTime += dt;
  }
  
  if (m_isExiting && 
      m_activeTime > 3.0f) // TODO CONFIG
  {
    // Go to next level
    // TODO Sound effect, explosion etc
    m_effect->SetVisible(true);

    // Set next level
    TheLevelManager::Instance()->SetLevelId(m_toLevel);
    TheGSMain::Instance()->OnExitReached();
  }
}

bool Exit::Save(File* f)
{
  if (!StaticFloor::Save(f))
  {
    return false;
  }
//  if (!SaveMeshResource(f))
//  {
//    return false;
//  }
  // Next level
  f->WriteComment("// Next level");
  f->WriteInteger(m_toLevel);

/*
  // TODO Hard coded values for billboard and particles
  f->WriteComment("// Billboard");
  f->Write("flare.png");
  f->WriteFloat(100.0f);
  f->WriteComment("// Particles");
  f->Write("sparkle1.png"); // TODO
  f->WriteFloat(20.0f); // TODO
  f->WriteInteger(50); // TODO
  f->WriteFloat(2.0f); // TODO
*/

  return SaveShadow(f);
}

bool Exit::Load(File* f)
{ 
  if (!StaticFloor::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

//  if (!LoadMeshResource(f))
//  {
//    f->ReportError("Failed to load exit mesh");
//    return false;
//  }

  // Load next level
  if (!f->GetInteger(&m_toLevel))
  {
    f->ReportError("Expected next level");
    return false;
  }

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}

bool Exit::CreateSceneNode()
{
  if (!StaticFloor::CreateSceneNode())
  {
    return false;
  }

  // Exit is translucent until activated
  // TODO So should be a Blended node !??
  m_pSceneNode->SetColour(Colour(0.5f, 0.5f, 0.5f, 0.5f));

  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes("transporter2.obj");
  if (!mesh)
  {
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  sm->SetBlended(true);
  m_cylinder = sm;
//  m_pSceneNode->AddChild(sm);

  TextMaker tm;
  m_text = tm.MakeText(ToString(m_toLevel));

  // Transformation for text
  Matrix mat;
  Matrix mat2;
  // Rotate the text 90 degs about x, so it's vertical
  mat.RotateX(DegToRad(90.0f));
  mat2.Scale(20, 20, 20);
  mat *= mat2;
  mat.TranslateKeepRotation(m_pos + Vec3f(0, 40.0f, 0));
  m_text->SetLocalTransform(mat);
  // Text is black
  m_text->SetColour(Colour(0.2f, 0.2f, 0.2f, 1));

  m_billboard = new Billboard;
  m_billboard->SetVisible(false);
  m_billboard->SetIsZReadEnabled(false);
//  if (!m_billboard->Load(f))
//  {
//    f->ReportError("Failed to load exit billboard");
//    return false;
//  }

//  m_pSceneNode->AddChild(m_billboard);

  m_effect = new ExitParticleEffect;
//  if (!m_effect->Load(f))
//  {
//    f->ReportError("Failed to load exit effect");
//    return false;
//  }
  m_effect->SetVisible(true);
//  m_pSceneNode->AddChild(m_effect);

  // Set nice big AABB for text, billboard and effect, so they are not culled
  static const float X2 = 40.0f;
  static const float Y2 = 40.0f;
  AABB aabb(-X2, X2, -Y2, Y2, -X2, X2);
  aabb.Translate(m_pos);
  m_text->RecursivelyTransformAABB(mat);
  m_billboard->SetAABB(aabb);
  m_effect->SetAABB(aabb);
  m_cylinder->SetAABB(aabb);

  // Currently there are no objectives, so all exits are enabled
  SetActive(); 

  return true;
}

void Exit::OnPlayerCollision()
{
  Assert(!m_isExiting); // already called
  m_isExiting = true;

  // Do this if we go directly to GSLevelCompleted state, with no time delay
  TheLevelManager::Instance()->SetLevelId(m_toLevel);
}

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

static const float PARTICLE_SPEED = 300.0f;

Vec3f ExitParticleEffect::NewVel() const
{
  return Vec3f(
    rnd(PARTICLE_SPEED), 
    rnd(PARTICLE_SPEED),
    rnd(PARTICLE_SPEED));

  // Particles spin so we want to emit them in all directions
  // z always towards us, or will be hidden by billboard
  //(float)rand() / (float)RAND_MAX * PARTICLE_SPEED);
}

float ExitParticleEffect::NewTime() const
{
  return (float)rand() / (float)RAND_MAX * 1.0f;
}

void ExitParticleEffect::HandleDeadParticle(Particle2d* p)
{
  Recycle(p);
}

void Exit::SetActive()
{
  if (m_isActive)
  {
    return;
  }

  m_isActive = true;
  m_activeTime = 0;
  m_effect->Start();
  m_billboard->SetVisible(true);
  m_pSceneNode->SetColour(Colour(1, 1, 1, 1));
}
}
