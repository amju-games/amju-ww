#ifdef WIN32
#define _USE_MATH_DEFINES // ffs
#endif // WIN32
#include <math.h>
#include "DegRad.h"
#include "OnFloor.h"
#include "Floor.h"
#include "File.h"
#include "LoadVec3.h"
#include "Sign.h"

namespace Amju
{
static const float GRAVITY = -200.0f;

OnFloor::Floors OnFloor::s_floors;

void OnFloor::AddFloor(Floor* f)
{
  s_floors.push_back(f);
}

void OnFloor::ClearFloors()
{
  s_floors.clear();
}

OnFloor::OnFloor()
{
  m_mass = 1.0f; // Default value, change in subclass ctor 
  m_shadow = 0;
  m_pSceneNode = 0;

  // Everything should accelerate down at the same rate
  m_acc = Vec3f(0, GRAVITY, 0); 

  Reset();

  m_isControlled = false; // TODO in Reset() ?
}

AABB* OnFloor::GetAABB()
{
  Assert(m_pSceneNode);
  return m_pSceneNode->GetAABB();
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
}

bool OnFloor::IsDead() const
{
  return m_isDead;
}

void OnFloor::SetFloor(Floor* floor)
{
  if (floor != m_floor)
  {
    m_floor = floor;
    if (m_shadow)
    {
      UpdateShadow();
    }
  }
}

const Floor* OnFloor::GetFloor() const
{
  return m_floor;
}

bool OnFloor::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected position");
    return false;
  }

  return true;
}

bool OnFloor::LoadShadow(File* f)
{
  Assert(m_pSceneNode);

  m_shadow = new Shadow;

  if (!m_shadow->Load(f))
  {
    return false;
  }
  m_pSceneNode->AddChild(m_shadow);

  return true;
}

void OnFloor::Reset()
{
  m_isDead = false;
  SetFloor(0);
  m_onFloor = false;
}

void OnFloor::FindFloor()
{
  for (unsigned int i = 0; i < s_floors.size(); i++)
  {
    // In general area ? - i.e. do our bounding boxes intersect ?
    Floor* f = s_floors[i];
    if (!GetAABB()->Intersects(*(f->GetAABB())))
    {
      continue;
    }
    // Touching surface ?
    float y = 0;
    if (f->GetY(Vec2f(m_pos.x, m_pos.z), &y))
    {
      // Are we above surface, but not too high, 
      //  or below surface, but not too low..?
      if (m_pos.y < (y + 100.0f) && m_pos.y > (y - 10.0f))
      {
        SetFloor(f);
        break;
      }
    }
  }
}

void OnFloor::PlayWav(OnFloor::Event e)
{
  // TODO
}

void OnFloor::UpdateXZ()
{
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
    if (m_pos.y < y)
    {
      // Stop box sinking
      GetAABB()->Translate(Vec3f(0, y - m_pos.y, 0));

      m_pos.y = y;
      if (m_vel.y < 0)
      {
        // We were falling - reverse y vel
        if (IsFalling())
        {
          PlayWav(AMJU_EVENT_LANDED);
          SetIsFalling(false);
        }
        m_vel.y = m_vel.y * -0.1f;
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
}

void OnFloor::UpdateShadow()
{
  Assert(m_shadow);
  if (m_floor)
  {
    m_shadow->SetCollisionMesh(const_cast<CollisionMesh*>(&(m_floor->GetCollisionMesh())));
  }
  else
  {
    m_shadow->SetCollisionMesh(0);
  }
}

void OnFloor::Update()
{
  GameObject::Update();

  //UpdateShadow(); // done in SetFloor() so we only set when floor changes

  UpdatePhysics();
}

void OnFloor::UpdatePhysics()
{
  // If we don't know which floor we are on, try to find the closest floor
  //  underneath us
  if (!m_floor)
  {
    FindFloor();
  }

  // Slide in direction of floor tilt
  SetTilt();

  UpdateXZ();
  UpdateY();

  if (m_onFloor)
  {
    Assert(m_floor);
    // So floor will tilt due to combined moments of all objects in contact with it
    m_floor->SetObjMassPos(m_mass, m_pos);
  }

  // Lower than the lowest floor ?
  if (m_pos.y < -500.0f) // TODO TEMP TEST
  {
    m_isDead = true;
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
