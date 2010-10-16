#include "Bonus.h"
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
  m_pos = m_pos * m_mat;
 
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

  if (!LoadShadow(f))
  {
    return false;
  }

  // Load bonus points ?
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
  m_shadow->SetVisible(false);

  Amju::PlayWav("cashreg"); // NB No file ext
  Amju::PlayWav("bonus_points"); // NB No file ext

  // Inc num lives
  int id = pPlayer->GetPlayerId();
  PlayerInfo* pInfo = ThePlayerInfoManager::Instance()->GetPlayerInfo(id);
  int lives = pInfo->GetInt(PlayerInfoKey::LIVES);
  ++lives;
  pInfo->Set(PlayerInfoKey::LIVES, lives);
}
}
