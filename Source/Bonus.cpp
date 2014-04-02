#include <AmjuRand.h>
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
#include "PropertiesDialog.h"
#include "PropertyKeys.h"

namespace Amju
{
const char* Bonus::NAME = "bonus";

GameObject* CreateBonus() { return new Bonus; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bonus::NAME, &CreateBonus);

static const float XSIZE = 15.0f;
static const float YSIZE = 15.0f;

Bonus::Bonus()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;
  m_isCollected = false;
  m_yRot = (float)(rand() % 180);
  m_lives = 0;
  m_points = 0;
}

bool Bonus::YesAddToLevel(int levelId, float depth) 
{
  // More bonuses the deeper you go??
  float f = Amju::Rnd(0, 10);
  bool b = (f > 5.0f);
  return b;
}

struct BonusKind
{
  std::string m_filename;
  int m_reward;

  BonusKind(const std::string& filename, int r) : m_filename(filename), m_reward(r) {}
};

void Bonus::Customise(int levelId, float depth) 
{
  static BonusKind BK[] = 
  {
    BonusKind("fruit1.obj", 0),
    BonusKind("fruit2.obj", 1),
    BonusKind("fruit3.obj", 2),
    BonusKind("fruit4.obj", 3),
  };
 
  static const int POINTS[] = { 1000, 2000, 4000, 8000 };

  // What kind of bonus?
  if (Rnd(0, 10) > 3) // PROCGEN
  {
    // Bonus points
    int r = (int)Rnd(0, 4);
    m_meshFilename = BK[r].m_filename;
    m_points = POINTS[BK[r].m_reward];  
    m_lives = 0;
    return;
  }
  else if (Rnd(0, 10) > 5) // PROCGEN
  {
    // TODO
    m_meshFilename = "bean1.obj";
  }
  else
  {
    m_meshFilename = "heart.obj";
    m_lives = 1;
    m_points = 0;
    return;
  }
}

void Bonus::AddPropertiesGui(PropertiesDialog* dlg) 
{
//  OnFloor::AddPropertiesGui(dlg);
  dlg->AddItem(new PropertiesDialog::FilenameItem("Mesh", m_meshFilename, PROP_MESH));

  dlg->AddItem(new PropertiesDialog::IntItem("Points", m_points, PROP_BONUS_POINTS));
  dlg->AddItem(new PropertiesDialog::IntItem("Lives", m_lives, PROP_BONUS_LIVES));
}

PropertyValue Bonus::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }
  return OnFloor::GetProp(key);
}

void Bonus::SetProp(PropertyKey key, PropertyValue value)
{
  OnFloor::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

WWGameObject* Bonus::Clone() 
{
  return new Bonus(*this);
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
//  m_pos = m_pos * m_mat;
 
  if (!LoadMeshResource(f))
  {
    f->ReportError("Failed to load bonus mesh");
    return false;
  }

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

  return true;
}

bool Bonus::CreateSceneNode()
{
  if (!OnFloor::CreateSceneNode())
  {
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

  return true;
}

void Bonus::Update()
{
  CheckIfDead(); // to delete when off screen

  // We don't want Bonuses to move
//  if (!m_floor)
//  {
//    FindFloor();
//  }

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

  GetSceneNode()->SetLocalTransform(mat);
}

void Bonus::OnPlayerCollision(Player* pPlayer)
{
  if (m_isCollected)
  {
    return;
  }

  m_isCollected = true;

  m_effect->Start(); 

  GetSceneNode()->SetVisible(false);

  m_effect->SetLocalTransform(GetSceneNode()->GetLocalTransform());
  m_effect->SetAABB(*(GetSceneNode()->GetAABB()));
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->AddChild(m_effect);
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
