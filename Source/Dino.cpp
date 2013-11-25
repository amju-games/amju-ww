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
#include "AIChasePet.h"
#include "AIFalling.h"
#include "AITurnToFace.h"

namespace Amju
{
GameObject* CreateDino() { return new Dino; }
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);

const char* Dino::NAME = "dino";
static const float XSIZE = 25.0f; // AABB size
static const float YSIZE = 30.0f;

Dino::Dino()
{
  AddAI(new AIIdle);
  AddAI(new AIGoHighGround);
  AddAI(new AIEatPet);
  AddAI(new AIChasePet);
  AddAI(new AIFalling);
  AddAI(new AITurnToFace);

  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;
}

WWGameObject* Dino::Clone() 
{
  return new Dino(*this);
}

void Dino::AddToGame() 
{
  Npc::AddToGame();
  
  SetAI(AIIdle::NAME); // can set now that we have created scene node
  // (when AI state is activated, it will set animation)
}

// Unusual as Dino shape needs asymmetric AABB
void Dino::UpdateAabb()
{
/*
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

  m_aabb.Set(minx, maxx, miny, maxy, minz, maxz);
  m_pSceneNode->SetAABB(m_aabb);
*/
}

const char* Dino::GetTypeName() const
{
  return NAME;
}

void Dino::Eat(Pet* pet)
{
  Assert(!IsEating());
  Assert(!IsDead());
  Assert(!pet->IsDead());
  Assert(pet->CanBeEaten());

  // Change to eating behaviour
  SetAI(AITurnToFace::NAME);
  m_ai->SetTarget(pet);
  m_ais[AIEatPet::NAME]->SetTarget(pet);

  // Change texture to bloody version.
  BlinkCharacter* bc = dynamic_cast<BlinkCharacter*>(m_pSceneNode.GetPtr());
  Assert(bc);
  bc->LoadTextures("dino1a-withblood.png", "dino1-withblood.png"); 
  // TODO Load the textures up front

  // Pause action and zoom camera on Dino??
}

bool Dino::IsEating() const
{
  return (m_ai->GetName() == AIEatPet::NAME);
}

void Dino::Update()
{
  Npc::Update();

  if (IsDead())
  {
    return;
  }

  // Asymmetric AABB not great for eating pets
//  UpdateAabb(); // updates shape of AABB, DOES change its position
}

bool Dino::Save(File* f)
{
  if (!Npc::Save(f))
  {
    return false;
  }
  f->WriteComment("// Dino type");
  f->WriteInteger(m_dinoType);
  return SaveShadow(f);
}

bool Dino::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  m_md2Name = "dino.md2";

  static const char* TEXTURES[3][2] = 
  {
    { "dino1a.png", "dino1.png" },
    { "dino2a.png", "dino2.png" },
    { "dino3a.png", "dino3.png" },
  };

  if (!f->GetInteger((int*)&m_dinoType))
  {
    f->ReportError("Expected dino type");
    return false;
  }
  Assert(m_dinoType >= 0 && m_dinoType <= 2);

  m_texNames[0] = TEXTURES[m_dinoType][0];
  m_texNames[1] = TEXTURES[m_dinoType][1];

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
