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

Exit::Exit()
{
  m_isActive = false;
  m_activeTime = 0;
  m_rotate = 0;
  m_toLevel = 0;
}

const char* Exit::GetTypeName() const
{
  return NAME;
}

void Exit::Reset()
{
  m_isActive = false;
}

void Exit::Update()
{
  if (!m_floor)
  {
    FindFloor();
  }

  // TODO ?? Do we need to clear shadow Coll meshes ?? 
  //UpdateShadow();

  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 3.0f;
  m_rotate += ROT_SPEED * dt;

  Matrix mat;
  mat.RotateY(m_rotate);
  mat.TranslateKeepRotation(m_pos);
  m_pSceneNode->SetLocalTransform(mat);

  if (m_isActive)
  {
    m_activeTime += dt;
  }
}

bool Exit::Load(File* f)
{
  if (!GameObject::Load(f)) // Get ID
  {
    return false;
  }
  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected exit position");
    return false;
  }
  m_pos = m_pos * m_mat;

  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load exit mesh");
    return false;
  }

  m_pSceneNode = new SceneMesh;
  ((SceneMesh*)m_pSceneNode)->SetMesh(mesh);

  // Set AABB 
  static const float XSIZE = 20.0f;
  static const float YSIZE = 60.0f;
  m_pSceneNode->GetAABB()->Set(
    -XSIZE, XSIZE, 
    0, YSIZE, 
    -XSIZE, XSIZE);
  GetAABB()->Translate(m_pos);  

  // Exit is translucent until activated
  // TODO So should be a Blended node !??
  m_pSceneNode->SetColour(Colour(0.5f, 0.5f, 0.5f, 0.5f));

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  // Load next level
  if (!f->GetInteger(&m_toLevel))
  {
    f->ReportError("Expected next level");
    return false;
  }

  // Next level ID is relative to this Level 
  m_toLevel += TheLevelManager::Instance()->GetLevelId();

  TextMaker tm;
  m_text = tm.MakeText(ToString(m_toLevel));

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_text);
  // If you add as child of exit node, numbers spin and are translucent... 
  //m_pSceneNode->AddChild(m_text);

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
  if (!m_billboard->Load(f))
  {
    f->ReportError("Failed to load exit billboard");
    return false;
  }
  m_pSceneNode->AddChild(m_billboard);

  m_effect = new ExitParticleEffect;
  if (!m_effect->Load(f))
  {
    f->ReportError("Failed to load exit effect");
    return false;
  }
  m_effect->SetVisible(false);
  m_pSceneNode->AddChild(m_effect);

  if (!LoadShadow(f))
  {
    return false;
  }

  // Currently there are no objectives, so all exits are enabled
  SetActive(); 

  return true;
}

void Exit::OnPlayerCollision()
{
  if (m_isActive && 
      m_activeTime > 2.0f) // TODO CONFIG
  {
    // Go to next level
    // TODO Sound effect, explosion etc
    m_effect->SetVisible(true);

    // Set next level
    TheLevelManager::Instance()->SetLevelId(m_toLevel);
    TheGSMain::Instance()->OnExitReached();
  }
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
  return (float)rand() / (float)RAND_MAX * 2.0f;
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
