#include "Pet.h"
#include <GameObjectFactory.h>
#include <File.h>
#include "BlinkCharacter.h"
#include "MySceneGraph.h"

namespace Amju
{
GameObject* CreatePet() { return new Pet; }
static bool reg = TheGameObjectFactory::Instance()->Add(Pet::NAME, &CreatePet);

const char* Pet::NAME = "pet";

Pet::Pet()
{
}

const char* Pet::GetTypeName() const
{
  return NAME;
}

void Pet::Update()
{
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

  m_pSceneNode = new BlinkCharacter;

  // TODO
  if (!((BlinkCharacter*)m_pSceneNode)->LoadMd2("pz-squirrel.md2"))
  {
    return false;
  }

  // TODO different colours
  if (!((BlinkCharacter*)m_pSceneNode)->LoadTextures("pz-pet1a.bmp", "pz-pet1.bmp"))
  {
    return false;
  }

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  // Create Shadow Scene Node
  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
