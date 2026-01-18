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

namespace Amju
{
GameObject* CreateDino() { return new Dino; }
static bool reg = TheGameObjectFactory::Instance()->Add(Dino::NAME, &CreateDino);

const char* Dino::NAME = "dino";

Dino::Dino()
{
  m_decideTime = 0;
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

  float m_dir = ((BlinkCharacter*)m_pSceneNode)->GetDir();
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

void Dino::Update()
{
  Npc::Update();

  UpdateAabb(); // updates shape of AABB, DOES change its position

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
