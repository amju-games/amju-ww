#include <AmjuRand.h>
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
#include "AIStunned.h"
#include "PropertiesDialog.h"
#include "RDRandom.h"

namespace Amju
{
GameObject* CreateDino() { return new Dino; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);
#endif

const char* Dino::NAME = "dino";
static const float XSIZE = 20.0f; // AABB size
static const float YSIZE = 30.0f;
static const float YOFFSET = 5.0f;

Dino::Dino()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsYOffset = YSIZE + YOFFSET;
  m_extentsSet = true;
  // Default blood texture names
  m_bloodTex[0] = "dino1a-withblood.png";
  m_bloodTex[1] = "dino1-withblood.png";
}

bool Dino::YesAddToLevel(int levelId, float depth)
{
  return true; // TODO TEMP TEST

  // More dinos in higher levels
  float r = RDRandom(10); // PROCGEN
  bool b = levelId > (int)r; 
  // extremely unlikely at low level, to a certainty at a high level.

  return b;
}

void Dino::Customise(int levelId, float depth)
{
  // TODO change attack speed etc ?
  // Can change texture here - but need bloody versions
}

void Dino::AddPropertiesGui(PropertiesDialog* dlg) 
{
  Npc::AddPropertiesGui(dlg);
}

PropertyValue Dino::GetProp(PropertyKey key)
{
//  switch (key)
//  {
//  case PROP_TEXT:
//    return m_text;
//  }
  return Npc::GetProp(key);
}

void Dino::SetProp(PropertyKey key, PropertyValue value)
{
  Npc::SetProp(key, value);
//  switch (key)
//  {
//  case PROP_TEXT:
//    m_text = value.GetString();
//  }
}

WWGameObject* Dino::Clone() 
{
  return new Dino(*this);
}

bool Dino::CreateSceneNode() 
{
  if (!Npc::CreateSceneNode())
  {
    return false;
  }
  BlinkCharacter* bc = dynamic_cast<BlinkCharacter*>(GetSceneNode());
  Assert(bc);
  Md2Model* md2 = bc->GetMd2();
  Md2Model::Animation anim = md2->GetAnimationFromName("stunned");
  if (anim != -1)
  {
    md2->SetDoesFreeze(anim, true);
  }

  anim = md2->GetAnimationFromName("eat");
  if (anim != -1)
  {
    md2->SetDoesFreeze(anim, true);
  }

  return true;
}

void Dino::AddToGame() 
{
  Npc::AddToGame();
 
  // Try making dinos stationary. This solves several problems. 
  AddAI(new AIIdle);
//  AddAI(new AIGoHighGround);
  AddAI(new AIEatPet);
//  AddAI(new AIChasePet);
  AddAI(new AIFalling);
  AddAI(new AITurnToFace);
//  AddAI(new AIStunned);

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

void Dino::Eat(OnFloorCharacter* pet)
{
  Assert(!IsEating());
  Assert(!IsDead());
  Assert(!pet->IsDead());
  Assert(pet->CanBeEaten());

  SetAnim("eat");

  // Change to eating behaviour
  SetAI(AITurnToFace::NAME);
  m_ai->SetTarget(pet);
  m_ais[AIEatPet::NAME]->SetTarget(pet);

  // Change texture to bloody version.
  BlinkCharacter* bc = dynamic_cast<BlinkCharacter*>(GetSceneNode());
  Assert(bc);
  bc->LoadTextures(m_bloodTex[0], m_bloodTex[1]); 
  // TODO Load the textures up front as this will hit frame rate on first load.

  pet->StartBeingEaten(this);

  // Pause action and zoom camera on Dino??
}

bool Dino::IsEating() const
{
  return (m_ai->GetName() == AIEatPet::NAME);
}

void Dino::Update()
{
  Npc::Update();
}

bool Dino::Save(File* f)
{
  if (!Npc::Save(f))
  {
    return false;
  }

  if (!f->Write(m_md2Name) || !f->Write(m_texNames[0]) || !f->Write(m_texNames[1]))
  {
    f->ReportError("Failed to write pet md2/texture data!");
    return false;
  }

  if (!f->Write(m_bloodTex[0]) || !f->Write(m_bloodTex[1]))
  {
    f->ReportError("Failed to write dino blood texture data!");
    return false;
  }

  return SaveShadow(f);
}

bool Dino::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;

  // Load mesh and 2 textures
  if (!f->GetDataLine(&m_md2Name))
  {
    f->ReportError("Expected pet md2 filename");
    return false;
  }

  if (!f->GetDataLine(&m_texNames[0]))
  {
    f->ReportError("Expected dino tex0 filename");
    return false;
  }

  if (!f->GetDataLine(&m_texNames[1]))
  {
    f->ReportError("Expected dino tex1 filename");
    return false;
  }

  if (!f->GetDataLine(&m_bloodTex[0]))
  {
    f->ReportError("Expected blood tex0 filename");
    return false;
  }

  if (!f->GetDataLine(&m_bloodTex[1]))
  {
    f->ReportError("Expected blood tex1 filename");
    return false;
  }

  if (!LoadShadow(f))
  {
    return false;
  }

  return true;
}
}
