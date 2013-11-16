#include "Pet.h"
#include <GameObjectFactory.h>
#include <File.h>
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"
#include "AIFalling.h"
#include "Floor.h"
#include "ShadowManager.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

static const float XSIZE = 15.0f;
static const float YSIZE = 20.0f;

Pet::Pet()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;
  m_carryingPlayer = 0;

  AddAI(new AIGoHighGround);
  AddAI(new AIIdle);
  AddAI(new AIFalling);
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
  Assert(!IsDead());
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
}

bool Pet::Save(File* f)
{
  // TODO
  return false;
}

bool Pet::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }

  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

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
  
  int r = rand() % NUM_MESHES;
  if (!bc->LoadMd2(MESHES[r]))
  {
    return false;
  }

  // Can set AI now we have a model
  SetAI(AIIdle::NAME);

  // TODO different colours
  r = rand() % NUM_TEXTURES;
  if (!bc->LoadTextures(TEXTURES[r][0], TEXTURES[r][1]))
  {
    return false;
  }

  bc->SetGameObj(this);
  PSceneNode root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(bc);

  // Create Shadow Scene Node
  if (!LoadShadow(f))
  {
    return false;
  }
/*
  // Create blood pool scene node
  m_bloodPool = new Shadow;
  if (!m_bloodPool->Load(f))
  {
    f->ReportError("Failed to load blood pool");
    return false;
  }
  root->AddChild(m_bloodPool);
  m_bloodPool->SetVisible(false); // TODO
*/
  return true;
}

void Pet::OnEaten()
{
  /*
  m_bloodPool->AddCollisionMesh(m_floor->GetCollisionMesh());

  m_bloodPool->SetLocalTransform(m_pSceneNode->GetLocalTransform());
  m_bloodPool->SetAABB(*m_pSceneNode->GetAABB());
  m_bloodPool->SetVisible(false); 
  // TODO Timer ?
  */

  SetDead(true);
  TheShadowManager::Instance()->RemoveCaster(this);

  // TODO if anims done
  //((Pet*)m_target)->SetAnim("eaten");
}
}
