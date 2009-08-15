#include "Dino.h"
#include "File.h"
#include "ResourceManager.h"
#include "ReportError.h"
#include "Timer.h"
#include "Floor.h"
#include "GameObjectFactory.h"
#include "DegRad.h"

namespace Amju
{
GameObject* CreateDino() { return new Dino; }
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);

const char* Dino::NAME = "dino";

Dino::Dino()
{
  static const float XSIZE = 15.0f;
  static const float YSIZE = 60.0f;
  m_aabb.Set(
    -XSIZE, XSIZE, 
    0, YSIZE, 
    -XSIZE, XSIZE);

  m_decideTime = 0;
}

const char* Dino::GetTypeName() const
{
  return NAME;
}

void Dino::Draw()
{
  OnFloor::Draw();
  DrawShadow(); // TODO temp hack
}

void Dino::Update()
{
  OnFloor::Update();

  // TODO TEMP TEST 
  // Walk towards highest place on Floor ?
  // TODO Behaviours - chase animals, etc
  m_decideTime += TheTimer::Instance()->GetDt();
  if (m_floor && m_decideTime > 2.0f) // TODO TEMP TEST 
  {
    m_decideTime = 0;
    Vec3f aim = m_floor->GetHighPoint();
    Vec3f vel = aim - m_pos;
    vel.y = 0;
    if (vel.SqLen() > 10.0f)
    {
      vel.Normalise();
      static const float SPEED = 50.0f; // TODO CONFIG
      vel *= SPEED;
      m_vel.x = vel.x;
      m_vel.z = vel.z;
      SetDir(RadToDeg(atan2(vel.x, vel.z)));
      SetIsControlled(true); 
    }
    else
    {
      SetIsControlled(false); 

      // ?
      //m_vel.x = 0;
      //m_vel.z = 0;
    }
  }
}

bool Dino::Load(File* f)
{
  if (!OnFloor::Load(f))
  {
    return false;
  }

  m_pModel = (Md2Model*)TheResourceManager::Instance()->GetRes("dino.md2");
  if (!m_pModel)
  {
    ReportError("Failed to load amju MD2");
    return false;
  }

  m_pTex[0] = (Texture*)TheResourceManager::Instance()->GetRes("dino1a.bmp");
  Assert(m_pTex[0]);

  m_pTex[1] = (Texture*)TheResourceManager::Instance()->GetRes("dino1.bmp");
  Assert(m_pTex[1]);

  m_shadow.Load();

  return true;
}
}
