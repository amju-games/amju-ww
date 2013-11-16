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

namespace Amju
{
GameObject* CreateDino() { return new Dino; }
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);

const char* Dino::NAME = "dino";

const float BLOOD_GRAVITY = -50.0f;
static const float PARTICLE_SPEED = 50.0f;

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

BloodFx::BloodFx(Dino* d) : m_dino(d)
{
}

Vec3f BloodFx::NewPos() const
{
  // Origin should be at mouth, which depends on dino size
  float d = 10.0f; // TODO TEMP TEST
  float y = 50.0f; 
  float rad = DegToRad(m_dino->GetDir());
  float x = cos(rad) * d;
  float z = sin(rad) * d;
  return m_dino->GetPos() + Vec3f(x, y, z);
}

Vec3f BloodFx::NewVel() const
{
  return Vec3f(
    rnd(PARTICLE_SPEED), 
    rnd(PARTICLE_SPEED),
    rnd(PARTICLE_SPEED));
}

float BloodFx::NewTime() const
{
  return 0; // was: (float)rand() / (float)RAND_MAX * 5.0f;
}

Vec3f BloodFx::NewAcc() const
{
  return Vec3f(0, BLOOD_GRAVITY, 0); 
}

void BloodFx::HandleDeadParticle(Particle2d* p)
{
  Recycle(p); // for testing
}

Dino::Dino()
{
  AddAI(new AIIdle);
  AddAI(new AIGoHighGround);
  AddAI(new AIEatPet);
  AddAI(new AIChasePet);
  AddAI(new AIFalling);
}

// Unusual as Dino shape needs asymmetric AABB
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

  m_aabb.Set(minx, maxx, miny, maxy, minz, maxz);
  m_pSceneNode->SetAABB(m_aabb);
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
}

void Dino::StartBloodEffect()
{
//  m_bloodFx->Start();
  // Make sure it's not culled
//  m_bloodFx->SetAABB(*m_pSceneNode->GetAABB());
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

  UpdateAabb(); // updates shape of AABB, DOES change its position
}

bool Dino::Save(File* f)
{
  // TODO
  return false;
}

bool Dino::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }

  BlinkCharacter* bc = new BlinkCharacter;
  m_pSceneNode = bc;

  std::string md2name = "dino.md2";
  Md2Model* model = (Md2Model*)TheResourceManager::Instance()->GetRes(md2name);
  if (!model)
  {
    ReportError("Failed to load MD2: " + md2name);
    return false;
  }
  //model->SetDoesFreeze(model->GetAnimationFromName("eat"), true);

  bc->SetMd2(model);

  // Can set AI now we have a model
  SetAI(AIIdle::NAME);

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

  if (!bc->LoadTextures(TEXTURES[m_dinoType][0], TEXTURES[m_dinoType][1]))
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
  // Blood particle effect for when pet eaten
  m_bloodFx = new BloodFx(this);
  if (!m_bloodFx->Load(f))
  {
    f->ReportError("Failed to load dino blood fx");
    return false;
  }
  root->AddChild(m_bloodFx.GetPtr());
*/
  return true;
}
}
