#include <GameObjectFactory.h>
#include <File.h>
#include <Timer.h>
#include <DegRad.h>
#include "Pet.h"
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"
#include "AIFalling.h"
#include "Floor.h"
#include "ShadowManager.h"
#include "Dino.h"
#include "PlayWav.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

static const float XSIZE = 15.0f;
static const float YSIZE = 20.0f;

static const float MAX_BEING_EATEN_TIME = 6.0f;

Pet::Pet()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;
  m_carryingPlayer = 0;
  m_eatenState = NOT_EATEN_YET;
  m_eatenTime = 0;

  AddAI(new AIGoHighGround);
  AddAI(new AIIdle);
  AddAI(new AIFalling);
}
  
bool Pet::CanBeEaten() const
{
  bool b = (m_eatenState == NOT_EATEN_YET) && !IsDead();
  return b;
}

void Pet::AddToGame() 
{
  Npc::AddToGame();
  
  SetAI(AIIdle::NAME); // can set now that we have created scene node
  // (when AI state is activated, it will set animation)

  // Blood particle effect for when pet eaten
  m_bloodFx = new BloodFx;
  // Tex, size, num, time
  //m_bloodFx->Set("wh8.png", 10, 20, 2.0f); // TODO TEMP TEST
  m_bloodFx->Set("gore.png", 2, 100, 2.0f, 0); // TODO TEMP TEST

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(m_bloodFx.GetPtr());

  // Create blood pool scene node
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes("blood_pool.obj");
  Assert(mesh);
  SceneMesh* sm  = new SceneMesh;
  sm->SetMesh(mesh);
  m_bloodPool = sm;
  root->AddChild(sm);
  m_bloodPool->SetVisible(false);
}

WWGameObject* Pet::Clone()
{
  return new Pet(*this);
}

const char* Pet::GetTypeName() const
{
  return NAME;
}

Player* Pet::GetCarryingPlayer()
{
  return m_carryingPlayer;
}

void Pet::SetCarryingPlayer(Player* player)
{
//  Assert(!IsDead()); // this can assert in edit mode
  if (player)
  {
    Assert(!m_carryingPlayer); // already carried!
  }
  m_carryingPlayer = player;
}

void Pet::Update()
{
  if (m_carryingPlayer)
  {
    OnFloorCharacter::Update(); // no AI etc
  }
  else
  {
    Npc::Update();
  }

  RecalcAABB();

  if (m_eatenState == BEING_EATEN)
  {
    float dt = TheTimer::Instance()->GetDt();
    m_eatenTime += dt;

    if (m_eatenTime > MAX_BEING_EATEN_TIME)
    {
      m_eatenState = HAS_BEEN_EATEN;
    }
  }
}

bool Pet::Save(File* f)
{
  if (!Npc::Save(f))
  {
    return false;
  }
 
  return SaveShadow(f);
}

bool Pet::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  const int NUM_MESHES = 3;
  static const char* MESHES[NUM_MESHES] = 
  {
    "pz-cat.md2",
    "pz-rabbit.md2",
    "pz-squirrel.md2"
  };

  const int NUM_TEXTURES = 5;
  static const char* TEXTURES[NUM_TEXTURES][2] = 
  {
    { "pz-pet1a.png", "pz-pet1.png" },
    { "pz-pet2a.png", "pz-pet2.png" },
    { "pz-pet3a.png", "pz-pet3.png" },
    { "pz-pet4a.png", "pz-pet4.png" },
    { "pz-pet5a.png", "pz-pet5.png" }
  };
  
  int r = rand() % NUM_MESHES; // TODO Load type
  m_md2Name = MESHES[r];

  r = rand() % NUM_TEXTURES; // TODO Load colour
  m_texNames[0] = TEXTURES[r][0];
  m_texNames[1] = TEXTURES[r][1];

  if (!LoadShadow(f))
  {
    return false;
  }
  return true;
}

void Pet::OnAnimFinished() 
{
  Npc::OnAnimFinished();
  if (m_eatenState == BEING_EATEN)
  {
    m_pSceneNode->SetVisible(false);    
  }
}

void Pet::StartBeingEaten(Dino* eater)
{
  // Is only called once per pet
  Amju::PlayWav("goopy");
//  Amju::PlayWav("goopy");

  Assert(m_eatenState == NOT_EATEN_YET);
  m_eatenState = BEING_EATEN;

  SetDead(true); // So physics won't be updated any more

  float dir = eater->GetDir();
  Matrix mat;
  mat.RotateY(DegToRad(dir));
  Vec3f pos = eater->GetPos();
  mat.TranslateKeepRotation(pos);
  m_pSceneNode->SetLocalTransform(mat);

  mat.Translate(m_pos); 
  m_bloodPool->SetLocalTransform(mat);
  m_bloodPool->SetVisible(true);

  SetAnim("eaten");

  // Remove from ShadowManager
  TheShadowManager::Instance()->RemoveCaster(this);

  m_bloodFx->SetMinY(GetPos().y);
  m_bloodFx->SetDino(eater);
  m_bloodFx->Start();

  // Make sure it's not culled
  m_bloodFx->SetAABB(*m_pSceneNode->GetAABB());

  /*
  m_bloodPool->AddCollisionMesh(m_floor->GetCollisionMesh());

  m_bloodPool->SetLocalTransform(m_pSceneNode->GetLocalTransform());
  m_bloodPool->SetAABB(*m_pSceneNode->GetAABB());
  m_bloodPool->SetVisible(false); 
  // TODO Timer ?
  */
}
}
