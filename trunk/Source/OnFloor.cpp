#ifdef WIN32
#define _USE_MATH_DEFINES // ffs
#endif // WIN32
#include <math.h>
#include <DegRad.h>
#include <ROConfig.h>
#include "OnFloor.h"
#include "Floor.h"
#include "File.h"
#include "LoadVec3.h"
#include "Sign.h"
#include "ShadowManager.h"
#include "GameMode.h"
#include "GameConsts.h"
#include "Describe.h"
#include "Depth.h"

namespace Amju
{
static const float GRAVITY = -200.0f;

OnFloor::Floors OnFloor::s_floors;

void OnFloor::RemoveFloor(Floor* f)
{
  s_floors.erase(f);
}

void OnFloor::AddFloor(Floor* f)
{
  s_floors.insert(f);
}

void OnFloor::ClearFloors()
{
  s_floors.clear();
}

OnFloor::OnFloor()
{
  m_mass = 1.0f; // Default value, change in subclass ctor 

  // Everything should accelerate down at the same rate
  m_acc = Vec3f(0, GRAVITY, 0); 

  Reset();

  m_isControlled = false; // TODO in Reset() ?
  
  m_wallCollide = false;
}

bool OnFloor::IsControlled() const
{
  return m_isControlled;
}

void OnFloor::SetIsControlled(bool b)
{
  m_isControlled = b;
}

bool OnFloor::IsFalling() const
{
  return m_isFalling;
}

void OnFloor::SetIsFalling(bool b)
{
  m_isFalling = b;
  if (b)
  {
    m_heightFallenFrom = m_pos.y;
  }
}

void OnFloor::SetFloor(Floor* floor)
{
  // TODO remember last good floor, and try this one first when looking
  //  for a floor in FindFloor
  // e.g.
  // if (m_floor) { m_lastGoodFloor = m_floor; } // && !floor ??

  if (floor && m_floor)
  {
    // Check if we should switch. If we are currently on m_floor, and floor is lower, we
    //  should not switch, right?
    const Vec3f& pos = GetPos();
    float y = 0;
    if (floor->GetY(Vec2f(pos.x, pos.z), & y) && y < pos.y)
    {
      // New floor is lower
      return;
    }
  }

  m_floor = floor;
}

const Floor* OnFloor::GetFloor() const
{
  return m_floor;
}

bool OnFloor::IsOnFloor() const
{
  return m_floor != 0; 
  // TODO multiple floors: 
  // return !m_floors.empty();
}

bool OnFloor::Save(File* f)
{
  f->WriteInteger(GetId());
  f->WriteComment("// Position");
  return SaveVec3(f, m_pos);
}

bool OnFloor::Load(File* f)
{
  if (!WWGameObject::Load(f))
  {
    return false;
  }
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected position");
    return false;
  }
//  m_pos = m_pos * m_mat;

  return true;
}

void OnFloor::Reset()
{
  WWGameObject::Reset(); 

  m_isDead = false;
  SetFloor(0);
  m_onFloor = false;
  m_heightFallenFrom = -9999.9f;
}

float OnFloor::CalcDropFallen()
{
  //if (!IsFalling())
  //{
  //  return 0;
  //}
  if (m_pos.y > m_heightFallenFrom)
  {
    return 0;
  }
  float h = m_heightFallenFrom - m_pos.y;

#ifdef SHOW_DROP_FALLEN_DEBUG
std::cout << Describe(this) << ": Drop: " << h << "\n";
#endif

  return h;
}

//void OnFloor::FindFloor()
//{
//  Floor* bestFloor = 0;
//  float bestY = -99999;
//  for (unsigned int i = 0; i < s_floors.size(); i++)
//  {
//    // In general area ? - i.e. do our bounding boxes intersect ?
//    Floor* f = s_floors[i];
//
//    // Touching surface ?
//    float y = 0;
//    if (f->GetY(Vec2f(m_pos.x, m_pos.z), &y))
//    {
//      // Are we above surface, but not too high, 
//      //  or below surface, but not too low..?
//      if (m_pos.y < (y + 100.0f) && m_pos.y > (y - 10.0f))
//      {
//        if (y > bestY)
//        {
//          bestY = y;
//          bestFloor = f;
//        }
//      }
//    }
//  }
//
//  if (bestFloor)
//  {
//    SetFloor(bestFloor);
//  }
//}

void OnFloor::PlayWav(OnFloor::Event e)
{
  // TODO
}

void OnFloor::UpdateXZ()
{
  static const float MIN_Z = ROConfig()->GetFloat("min_z");
  static const float MAX_Z = ROConfig()->GetFloat("max_z");

  Vec3f pos = GetPos();
  pos.z = std::min(std::max(pos.z, MIN_Z), MAX_Z);
  SetPos(pos);

  /* no friction..?

  // Decelerate in x-z due to friction
  // This will depend on the object - a brick will slow down quicker than a ball.
  static const float FRICTION = 0.99f;
  m_vel.x *= FRICTION;
  m_vel.z *= FRICTION;
  // Below some small velocity, come to a complete stop.
  static const float STOP = 0.01f;
  bool stopped = true;
  if (fabs(m_vel.x) < STOP)
  {
    m_vel.x = 0;
  }
  else
  {
    stopped = false;
  }
  if (fabs(m_vel.z) < STOP)
  {
    m_vel.z = 0;
  }
  else
  {
    stopped = false;
  }
  if (stopped)
  {
    SetIsControlled(false);
  }
  */
}

void OnFloor::UpdateY()
{
  // Make sure setting acceleration doesn't stop gravity working
  m_acc.y = GRAVITY;

  static const float MAX_Y_VEL = ROConfig()->GetFloat("max-y-vel");
  Assert(MAX_Y_VEL > 0);
  if (m_vel.y < -MAX_Y_VEL)
  {
    m_vel.y = -MAX_Y_VEL;
  }

  // Fallen off ?
  float y = 0;
  bool isOn = false;
  if (m_floor)
  {
    isOn = m_floor->GetY(Vec2f(m_pos.x, m_pos.z), &y);
  }

  if (isOn)
  {
    // Make sure y value is updated so we are on the surface
    const float MAX_DT = 0.1f; // max set in Timer
    const float MAX_FALL_DIST = MAX_Y_VEL * MAX_DT;
    if (m_pos.y < y && m_pos.y > (y - MAX_FALL_DIST)) // TODO TEMP TEST
    {
      // Stop box sinking
      m_pos.y = y;

      if (m_vel.y < 0)
      {
        // We were falling - reverse y vel
        if (IsFalling())
        {
          PlayWav(AMJU_EVENT_LANDED);
          SetIsFalling(false);

          OnHitFloor();
        }
        static const float DAMP = 0.2f; // TODO ROCONFIG
        m_vel.y = m_vel.y * -DAMP;
        m_onFloor = false;
        if (fabs(m_vel.y) < 1.0f) // TODO Bounce damp
        {
          m_vel.y = 0;
          m_onFloor = true;
        }
      }
    }
  }
  else
  {
    if (!IsFalling())
    {
      SetIsFalling(true); // TODO TEMP TEST
    }

/*
    // Check a bit more thoroughly for a floor - we are maybe just on the edge. 
    // If there really is no floor under us, we start to fall down.
    float y = 0;
    bool isOn = m_floor && (
      m_floor->GetY(Vec2f(m_aabb.GetMin(0), m_aabb.GetMin(2)), &y) ||
      m_floor->GetY(Vec2f(m_aabb.GetMax(0), m_aabb.GetMin(2)), &y) ||
      m_floor->GetY(Vec2f(m_aabb.GetMax(0), m_aabb.GetMax(2)), &y) ||
      m_floor->GetY(Vec2f(m_aabb.GetMin(0), m_aabb.GetMax(2)), &y));

    if (!isOn)
    {
      SetIsControlled(false);

      // We are not on the platform - just fall.
      SetFloor(0);
      m_onFloor = false;

      if (!IsFalling())
      {
        PlayWav(AMJU_EVENT_FALL);
        SetIsFalling(true);
      }
    }
*/
  }
}

void OnFloor::Update()
{
  m_oldPos = m_pos;

  WWGameObject::Update();

  if (m_isDead && !IsEditMode())
  {
    return;
  }

  UpdatePhysics();
  RecalcAABB();
}

const Vec3f& OnFloor::GetOldPos() const
{
  return m_oldPos;
}

void OnFloor::UpdatePhysics()
{
  // If we don't know which floor we are on, try to find the closest floor
  //  underneath us

  // Called in CollideObjectFloor as well
//  if (!m_floor)
//  {
//    FindFloor();
//  }

  // Slide in direction of floor tilt
  SetTilt();

  UpdateXZ();
  UpdateY();

  if (m_onFloor)
  {
    Assert(m_floor);
    // So floor will tilt due to combined moments of all objects in contact with it
    m_floor->SetObjMassPos(m_mass, m_pos);

    m_lastFloorRotation = *(m_floor->GetMatrix());
  }

  // Have fallen too far, maybe off world ?
  static const float MAX_DROP = ROConfig()->GetFloat("max-drop");
  float df = CalcDropFallen();
  if (df > MAX_DROP) 
  {
#ifdef _DEBUG
std::cout << Describe(this) << " dead, max drop reached, drop=" << df <<
  " is falling: " << IsFalling() << "\n";
#endif
    SetDead(true); // max drop reached, still falling?
  }
}

void OnFloor::SetTilt()
{
  if (!m_floor)
  {
    return;
  }

  Vec3f xAxis(1.0f, 0, 0);
  Vec3f zAxis(0, 0, 1.0f);

  Matrix mat = *(m_floor->GetMatrix());
  // Zero any translation, so xAxis and zAxis will remain unit length
  mat.TranslateKeepRotation(Vec3f(0, 0, 0));
  xAxis = xAxis * mat;
  zAxis = zAxis * mat;

  Assert(fabs(xAxis.SqLen() - 1.0f) < 0.0001f);
  Assert(fabs(zAxis.SqLen() - 1.0f) < 0.0001f);

  m_acc.x = GRAVITY * (float)acos(xAxis.x) * Sign(xAxis.y);
  m_acc.z = GRAVITY * (float)acos(zAxis.z) * Sign(zAxis.y);

  // Don't start to move until force exceeds the force due to friction at rest
  // This value is different for different types of objects - e.g. a ball
  //  vs a brick
  static const float REST_FRICTION = 0.1f; // TODO
  if (fabs(m_acc.x) < REST_FRICTION)
  {
    m_acc.x = 0;
  }
  if (fabs(m_acc.z) < REST_FRICTION)
  {
    m_acc.z = 0;
  }
}
}
