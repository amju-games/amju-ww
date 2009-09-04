#include "Bonus.h"
#include "LoadVec3.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "Colour.h"
#include "Timer.h"
#include "SoundManager.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "ObjMesh.h"

namespace Amju
{
const char* Bonus::NAME = "bonus";

GameObject* CreateBonus() { return new Bonus; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bonus::NAME, &CreateBonus);

Bonus::Bonus()
{
  m_isCollected = false;

  m_yRot = (float)(rand() % 180);
}

const char* Bonus::GetTypeName() const
{
  return NAME;
}

bool Bonus::Load(File* f)
{
  if (!GameObject::Load(f)) // Get ID
  {
    return false;
  }
  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected bonus position");
    return false;
  }
 
  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load bonus mesh");
    return false;
  }

  m_pSceneNode = new SceneMesh;
  ((SceneMesh*)m_pSceneNode)->SetMesh(mesh);

  // Set bounding box 
  static const float XSIZE = 15.0f;
  static const float YSIZE = 50.0f;
  m_pSceneNode->GetAABB()->Set(
    -XSIZE, XSIZE, 
    -YSIZE, YSIZE, 
    -XSIZE, XSIZE);
  m_pSceneNode->GetAABB()->Translate(m_pos);  

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  // Load bonus points ?
  File effectFile;
  if (!effectFile.OpenRead("bonus-effect.txt"))
  {
    effectFile.ReportError("Couldn't open bonus effect file");
    return false;
  }
  m_effect = new BonusParticleEffect;
  if (!m_effect->Load(&effectFile))
  {
    effectFile.ReportError("Failed to load bonus effect");
    return false;
  }

  m_pSceneNode->AddChild(m_effect);

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}

/*
void Bonus::Draw()
{
  m_effect.Draw();

  if (m_isCollected)
  {
    return;
  }

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();
  AmjuGL::Translate(m_pos.x, m_pos.y, m_pos.z);
  AmjuGL::RotateY(m_yRot);
  PushColour();
  MultColour(Colour(1, 0, 0.5f, 1));
  m_mesh->Draw();
  PopColour();
  AmjuGL::PopMatrix();
  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);

  m_aabb.Draw();
}
*/

void Bonus::Update()
{
  // We don't want Bonuses to move
  if (!m_floor)
  {
    FindFloor();
  }

  if (m_isCollected)
  {
    m_effect->Update();
  }
  else
  {
    UpdateShadow();
  }

  // Spin around
  // Do this even when collected so particles spin round too
  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 2.0f;
  m_yRot += ROT_SPEED * dt;

  Matrix mat;
  mat.RotateY(m_yRot);
  mat.TranslateKeepRotation(m_pos);

  m_pSceneNode->SetLocalTransform(mat);
}

void Bonus::OnPlayerCollision()
{
  if (m_isCollected)
  {
    return;
  }

  m_isCollected = true;

  m_effect->Start(); 

  m_pSceneNode->SetVisible(false);
  m_effect->SetVisible(true);
  m_shadow->SetVisible(false);

  TheSoundManager::Instance()->PlayWav("cashreg"); // NB No file ext
  TheSoundManager::Instance()->PlayWav("bonus_points"); // NB No file ext
}
}
