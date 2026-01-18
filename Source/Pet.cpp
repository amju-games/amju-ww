#include "Pet.h"
#include <GameObjectFactory.h>
#include <File.h>
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"
#include "AIFalling.h"
#include "Floor.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

Pet::Pet()
{
  AddAI(new AIGoHighGround);
  AddAI(new AIIdle);
  AddAI(new AIFalling);
}

const char* Pet::GetTypeName() const
{
  return NAME;
}

void Pet::Update()
{
  Npc::Update();

  if (IsDead())
  {
    return;
  }

  static const float XSIZE = 15.0f;
  static const float YSIZE = 60.0f;
  GetAABB()->Set(
    m_pos.x - XSIZE, m_pos.x + XSIZE, 
    m_pos.y, m_pos.y + YSIZE, 
    m_pos.z - XSIZE, m_pos.z + XSIZE);
}

bool Pet::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }

  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

  // TODO
  if (!bc->LoadMd2("pz-squirrel.md2"))
  {
    return false;
  }

  // Can set AI now we have a model
  SetAI(AIIdle::NAME);

  // TODO different colours
  if (!bc->LoadTextures("pz-pet1a.png", "pz-pet1.png"))
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

  // Create blood pool scene node
  m_bloodPool = new Shadow;
  if (!m_bloodPool->Load(f))
  {
    f->ReportError("Failed to load blood pool");
    return false;
  }
  root->AddChild(m_bloodPool);
  m_bloodPool->SetVisible(false); // TODO

  return true;
}

void Pet::OnEaten()
{
  m_bloodPool->AddCollisionMesh(m_floor->GetCollisionMesh());

  m_bloodPool->SetLocalTransform(m_pSceneNode->GetLocalTransform());
  *(m_bloodPool->GetAABB()) = *(m_pSceneNode->GetAABB());
  m_bloodPool->SetVisible(false); 
  // TODO Timer ?

  SetDead(true);

  // TODO if anims done
  //((Pet*)m_target)->SetAnim("eaten");
}
}
