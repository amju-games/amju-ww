#include "Dino.h"
#include "File.h"
#include "ResourceManager.h"
#include "ReportError.h"
#include "Timer.h"
#include "Floor.h"
#include "GameObjectFactory.h"
#include "DegRad.h"
#include "BlinkCharacter.h"
#include "MySceneGraph.h"
#include "Pet.h"
#include "AIEatPet.h"
#include "AIGoHighGround.h"
#include "AIIdle.h"

namespace Amju
{
GameObject* CreateDino() { return new Dino; }
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);

const char* Dino::NAME = "dino";

Dino::Dino()
{
  AddAI(new AIIdle);
  AddAI(new AIGoHighGround);
  AddAI(new AIEatPet);

  SetAI(AIIdle::NAME);
}

void Dino::UpdateAabb()
{
  static const float XSIZE = 15.0f;
  static const float YSIZE = 60.0f;
  static const float ZSIZE = 45.0f;

  float minx = 0;
  float minz = 0;
  float maxx = 0;
  float maxz = 0;

  while (m_dir > 180.0f)
  {
    m_dir -= 360.0f;
  }
  while (m_dir < -180.0f)
  {
    m_dir += 360.0f;
  }
  Assert(m_dir >= -180.0f);
  Assert(m_dir <=  180.0f);

  minx = m_pos.x - XSIZE;
  maxx = m_pos.x + XSIZE;
  minz = m_pos.z - XSIZE;
  maxz = m_pos.z + XSIZE;

  if (m_dir < -135.0f || m_dir >= 135.0f)
  { 
    minz = m_pos.z - ZSIZE;
  }
  else if (m_dir <= -45.0f)
  {
    minx = m_pos.x - ZSIZE;
  }
  else if (m_dir <= 45.0f)
  {
    maxz = m_pos.z + ZSIZE;
  }
  else if (m_dir <= 135.0f)
  {
    maxx = m_pos.x + ZSIZE;
  }
  else 
  {
    Assert(0);
  }

  float miny = m_pos.y;
  float maxy = m_pos.y + YSIZE;

  GetAABB()->Set(minx, maxx, miny, maxy, minz, maxz);
}

const char* Dino::GetTypeName() const
{
  return NAME;
}

void Dino::Eat(Pet* pet)
{
  Assert(!pet->IsDead());

  // Change to eating behaviour
  SetAI(AIEatPet::NAME);
  m_ai->SetTarget(pet);

  // This pet disappears - TODO Gory effect
}

void Dino::Update()
{
  Npc::Update();

  UpdateAabb(); // updates shape of AABB, DOES change its position
}

bool Dino::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }

  m_pSceneNode = new BlinkCharacter;

  if (!((BlinkCharacter*)m_pSceneNode)->LoadMd2("dino.md2"))
  {
    return false;
  }

  // TODO different colours
  if (!((BlinkCharacter*)m_pSceneNode)->LoadTextures("dino1a.bmp", "dino1.bmp"))
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
