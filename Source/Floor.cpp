#include "DegRad.h"
#include "Floor.h"
#include "ResourceManager.h"
#include "Timer.h"
#include "GameObjectFactory.h"
#include "OnFloor.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "LoadVec3.h"

namespace Amju
{
GameObject* CreateFloor() { return new Floor; }
static bool reg = TheGameObjectFactory::Instance()->Add(Floor::NAME, &CreateFloor);

const char* Floor::NAME = "floor";

Floor::Floor()
{
  OnFloor::AddFloor(this);

  m_angularAccel = 0;
  m_angularVel = 0;
  m_rotAxis = Vec3f(1.0, 0, 0); 
  // Just needs to be non-zero until a real axis of rotation is found

  m_rotAxes = AMJU_X;
}

const char* Floor::GetTypeName() const
{
  return NAME;
}

void Floor::Reset()
{
  m_angularAccel = 0;
  m_angularVel = 0;
  m_rotAxis = Vec3f(1.0, 0, 0); 
  ResetMoments();
  m_quat.SetIdentity();
  m_matrix.SetIdentity();
}

bool Floor::Load(File* f)
{
  if (!GameObject::Load(f))
  {
    return false;
  }

  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected floor position");
    return false;
  }

  m_mesh = LoadMeshResource(f);

  m_mesh->CalcCollisionMesh(&m_collMesh);
  Matrix m;
  m.Translate(m_pos);
  m_collMesh.Transform(m);

  if (!f->GetInteger((int*)&m_rotAxes))
  {
    f->ReportError("Expected floor rot axes flags");
    return false;
  }

  return true;
}

const CollisionMesh& Floor::GetCollisionMesh() const
{
  return m_collMesh;
}

void Floor::Draw()
{
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);

  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(0, 1, 0)); // Light direction

  AmjuGL::PushMatrix();

  AmjuGL::MultMatrix(m_matrix);
  m_mesh->Draw();

  AmjuGL::PopMatrix();

  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);

  // TODO TEMP TEST
  // Should match obj mesh!
//  m_collMesh.Draw();
  GetAABB().Draw(); // box enclosing collision mesh
}

Matrix* Floor::GetMatrix()
{
  return &m_matrix;
}

bool Floor::GetY(const Vec3f& v, float* pY)
{
  return m_collMesh.GetY(v, pY);
}

void Floor::SetObjMassPos(float mass, const Vec3f& pos)
{
  // TODO Clear tilt at start of frame ?
  // Otherwise how do we know when an object moves or leaves floor ?

  // Calc distance from fixed pivot.
  // Mass * distance = moment ?
  // Work out force
  // -> rotational acceleration about x and z axes

  // Assuming origin is pivot
//  float dist = sqrt(pos.SqLen());
//  float moment = mass * dist;

  // Remove components where there is no rotational freedom
  Vec3f v = pos;

  if (m_rotAxes & AMJU_X  && m_rotAxes & AMJU_Z)
  {
    // Do nothing
  }
  else if (m_rotAxes & AMJU_X)
  {
    v.x = 0;
  }
  else if (m_rotAxes & AMJU_Z)
  {
    v.z = 0;
  }

  m_moments += v * mass;
}

void Floor::ResetMoments()
{
  m_moments = Vec3f();
}

void Floor::Update()
{
  m_highPoint = -m_moments;

  // Remember old values, in case we need to restore them
  Quaternion oldQuat = m_quat;
  Matrix oldMatrix = m_matrix;
  CollisionMesh oldCollMesh = m_collMesh;
  AABB oldAabb = m_aabb;

  float dt = TheTimer::Instance()->GetDt();
  // We have net moment acting on floor.
  // Torque (== moment)
  // Torque vector = r (vector) cross F (vector)
  //  == axis of rotation

  // Torque magnitude:  T = rF sin(theta) 
  // r = length of lever arm vector; r vec is vector from axis to point of force application
  // theta is angle between force vector and lever arm vector
  if (fabs(m_moments.SqLen()) < 0.1f)
  {
    // No torque, so no angular acceleration
    m_angularAccel = 0;
  }
  else
  {
    // Update angular accel
    // Get axis about which the torque tends to rotate us
    static const Vec3f DOWN(0, -1.0f, 0);
    Vec3f axis = CrossProduct(m_moments, DOWN);
    if (m_rotAxes & AMJU_X  && m_rotAxes & AMJU_Z)
    {
    }
    else if (m_rotAxes & AMJU_X)
    {
      axis.y = 0;
      axis.z = 0;
    }
    else if (m_rotAxes & AMJU_Z)
    {
      axis.x = 0;
      axis.y = 0;
    }

    // Check we will get an axis - i.e. there has to be some non-zero moment 
    if (axis.SqLen() > 0)
    {
      m_rotAxis = axis;
      m_rotAxis.Normalise();

      // Magnitude of torque
      float torque = sqrt(m_moments.SqLen()); // TODO sin theta

      // Angular acceleration = torque / I  (I = Moment Of Inertia, like mass for rotations)
      static const float I = 40.0f; // TODO TEMP TEST
      m_angularAccel = torque / I;
    }
  }

  ResetMoments();

  // Remember old vel, get average, like for linear motion 
  // (Doesn't seem to make much difference)
  float oldAngularVel = m_angularVel;
  m_angularVel += m_angularAccel * dt;

  // TODO Stop rotating if angular vel is low..?
  // Dampen angular vel ?

  // Angle through which we rotate this frame
  float ang = (oldAngularVel + m_angularVel) * (dt * 0.5f);
  Quaternion q;
  q.CreateFromAxisAngle(m_rotAxis.x, m_rotAxis.y, m_rotAxis.z, ang);
  m_quat = q * m_quat;
  m_quat.Normalize();
  m_quat.CreateMatrix(&m_matrix);
  m_matrix.TranslateKeepRotation(m_pos);

  // Transform the collision mesh by the rotation for this frame
  Matrix qMat;
  q.CreateMatrix(&qMat);
  // Reverse translation so we rotate about origin
  m_collMesh.Translate(-m_pos);
  // Perform rotation
  m_collMesh.Transform(qMat);
  // Move back to position
  m_collMesh.Translate(m_pos);

  // Calculate AABB for the collision mesh
  m_collMesh.CalcAABB(&m_aabb);

  // If the collision mesh AABB is too tall, we have reached the max rotation.
  // In this case, restore the old values for m_quat, m_matrix, m_collMesh, m_aabb
  static const float MAX_Y_SIZE = 100.0f; // TODO CONFIG/per floor ???
  if (m_aabb.GetYSize() > MAX_Y_SIZE)
  {
    m_quat = oldQuat;
    m_matrix = oldMatrix;
    m_collMesh = oldCollMesh;
    m_aabb = oldAabb;
  }
}

const Vec3f& Floor::GetHighPoint() const
{
 return m_highPoint;
}
}

