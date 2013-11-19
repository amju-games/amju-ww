#include "Bonus.h"
#include "Score.h"
#include "LoadVec3.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "Colour.h"
#include "Timer.h"
#include "PlayWav.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "ObjMesh.h"
#include "PlayerInfo.h"
#include "PlayerInfoKey.h"
#include "Player.h"
#include "ShadowManager.h"

namespace Amju
{
const char* Bonus::NAME = "bonus";

GameObject* CreateBonus() { return new Bonus; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bonus::NAME, &CreateBonus);

static const float XSIZE = 15.0f;
static const float YSIZE = 50.0f;

Bonus::Bonus()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;
  m_isCollected = false;
  m_yRot = (float)(rand() % 180);
  m_lives = 0;
  m_points = 0;
}

const char* Bonus::GetTypeName() const
{
  return NAME;
}

bool Bonus::Save(File* f)
{
  f->WriteInteger(GetId());
  if (!SaveVec3(f, m_pos))
  {
    f->ReportError("Failed to save bonus position");
    return false;
  }
  if (!SaveMeshResource(f))
  {
    f->ReportError("Failed to save bonus mesh");
    return false;
  }
  if (!SaveShadow(f))
  {
    f->ReportError("Failed to save bonus shadow");
    return false;
  }
  return f->WriteComment("// Bonus points") &&
    f->WriteInteger(m_points) &&
    f->WriteComment("// Bonus lives") &&
    f->WriteInteger(m_lives);
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
  m_startPos = m_pos;
  m_pos = m_pos * m_mat;
 
  ObjMesh* mesh = LoadMeshResource(f);
  if (!mesh)
  {
    f->ReportError("Failed to load bonus mesh");
    return false;
  }

  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  m_pSceneNode = sm;

  // Set bounding box 
  RecalcAABB();

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  if (!LoadShadow(f))
  {
    return false;
  }

  // Load bonus points ?
  if (!f->GetInteger(&m_points))
  {
    f->ReportError("Expected bonus points");
    return false;
  }

  if (!f->GetInteger(&m_lives))
  {
    f->ReportError("Expected bonus lives");
    return false;
  }

  File effectFile; 
  // For nested glue files to work, this should be last or destroyed before further reading
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

  return true;
}

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
    // TODO ?? Do we need to clear shadow Coll meshes ?? 
    //UpdateShadow();
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

void Bonus::OnPlayerCollision(Player* pPlayer)
{
  if (m_isCollected)
  {
    return;
  }

  m_isCollected = true;

  m_effect->Start(); 

  m_pSceneNode->SetVisible(false);
  m_effect->SetVisible(true);

  TheShadowManager::Instance()->RemoveCaster(this);

  Amju::PlayWav("cashreg"); // NB No file ext
  Amju::PlayWav("bonus_points"); // NB No file ext

  PlayerNum pn = (PlayerNum)pPlayer->GetPlayerId();
  if (m_points)
  {
    // Play wav for points
   
    TheScores::Instance()->AddToScore(pn, m_points);
  }
  
  if (m_lives)
  {
    // Wav

    TheScores::Instance()->IncLives(pn);
  }
}
}
