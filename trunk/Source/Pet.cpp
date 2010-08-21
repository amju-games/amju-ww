#include "Pet.h"
#include <GameObjectFactory.h>
#include <File.h>
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

Pet::Pet()
{
  AddAI(new AIGoHighGround);
  AddAI(new AIIdle);
}

const char* Pet::GetTypeName() const
{
  return NAME;
}

void Pet::Update()
{
  if (IsDead())
  {
    m_pSceneNode->SetVisible(false);
    return;
  }

  Npc::Update();

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
  if (!bc->LoadTextures("pz-pet1a.bmp", "pz-pet1.bmp"))
  {
    return false;
  }

  bc->SetGameObj(this);
  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(bc);

  // Create Shadow Scene Node
  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
