#include "DegRad.h"
#include "Floor.h"
#include "ResourceManager.h"
#include "Timer.h"
#include "GameObjectFactory.h"
#include "OnFloor.h"
#include <File.h>
#include "LoadMeshResource.h"
#include "LoadVec3.h"
#include "MySceneGraph.h"
#include "SceneMesh.h"
#include "LoadTextureResource.h"

namespace Amju
{
GameObject* CreateFloor() { return new Floor; }
static bool reg = TheGameObjectFactory::Instance()->Add(Floor::NAME, &CreateFloor);

const char* Floor::NAME = "floor";

FloorMesh::FloorMesh(Floor* floor) : m_floor(floor)
{
}

void FloorMesh::Draw()
{
  AmjuGL::PushAttrib(AmjuGL::AMJU_LIGHTING);
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  m_pTex->UseThisTexture();
  SceneMesh::Draw();
  AmjuGL::PopAttrib();

  //m_floor->DrawCollisionMesh();
}

void FloorMesh::SetTexture(PTexture tex)
{
  m_pTex = tex;
}

Floor::Floor()
{
  OnFloor::AddFloor(this);

  m_rotAxis = Vec3f(1.0, 0, 0); 
  // Just needs to be non-zero until a real axis of rotation is found

  m_rotAxes = 0;
  m_maxYSize = 0;

  m_inertia = 1.0f;

  m_yRot = 0;
}

const char* Floor::GetTypeName() const
{
  return NAME;
}

AABB* Floor::GetAABB()
{
  Assert(m_pSceneNode);
  return m_pSceneNode->GetAABB();
}

void Floor::Reset()
{
  m_angularAccel = Quaternion();
  m_angularVel = Quaternion();
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
  m_pos = m_pos * m_mat;

  // Load rotation around y axis
  if (!f->GetFloat(&m_yRot))
  {
    f->ReportError("Expected floor y rot");
    return false;
  }

  // Load mesh 
  ObjMesh* mesh = LoadMeshResource(f);

  mesh->CalcCollisionMesh(&m_collMesh);
  Matrix m;
  m.RotateY(DegToRad(m_yRot));
  m.TranslateKeepRotation(m_pos);
  m_collMesh.Transform(m);

  // Load texture
  Texture* pTex = LoadTextureResource(f); 

  if (!f->GetInteger((int*)&m_rotAxes))
  {
    f->ReportError("Expected floor rot axes flags");
    return false;
  }

  if (!f->GetFloat(&m_maxYSize))
  {
    f->ReportError("Expected floor AABB max height");
    return false;
  }

  if (!f->GetFloat(&m_inertia))
  {
    f->ReportError("Expected floor moment of inertia");
    return false;
  }

  FloorMesh* fm= new FloorMesh(this);
  fm->SetMesh(mesh);
  fm->SetTexture(pTex);
  m_pSceneNode = fm;

  GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE)->
    AddChild(m_pSceneNode);

  return true;
}

CollisionMesh* Floor::GetCollisionMesh()
{
  return &m_collMesh;
}

Matrix* Floor::GetMatrix()
{
  return &m_matrix;
}

bool Floor::GetY(const Vec2f& v, float* pY)
{
  return m_collMesh.GetY(v, pY);
}

void Floor::SetObjMassPos(float mass, const Vec3f& pos)
{
  // Remove components where there is no rotational freedom
  Vec3f v = pos;
  // Get v rel to pivot of the Floor!
  v -= m_pos;
  v.y = 0;

  if ((m_rotAxes & AMJU_X) && (m_rotAxes & AMJU_Z))
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
  else
  {
    // This floor does not tilt - e.g. spawn point
    v.x = 0;
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
  m_highPoint = m_pos - m_moments;

  // Remember old values, in case we need to restore them
  Quaternion oldQuat = m_quat;
  Matrix oldMatrix = m_matrix;
  CollisionMesh oldCollMesh = m_collMesh;
  AABB oldAabb = *(GetAABB());

  float dt = TheTimer::Instance()->GetDt();
  // We have net moment acting on floor.
  // Torque (== moment)
  // Torque vector = r (vector) cross F (vector)
  //  == axis of rotation

  // Torque magnitude:  T = rF sin(theta) 
  // r = length of lever arm vector; r vec is vector from axis to point of force application
  // theta is angle between force vector and lever arm vector
  float sqLenMoments = m_moments.SqLen(); 
  if (fabs(sqLenMoments) < 0.1f)
  {
    // No torque, so no angular acceleration
    m_angularAccel = Quaternion();
    // TODO ResetMoments and return ?
  }
  else
  {
    // Update angular accel
    // Get axis about which the torque tends to rotate us
    static const Vec3f DOWN(0, -1.0f, 0);
    Vec3f axis = CrossProduct(m_moments, DOWN);
    axis.y = 0;
    if (m_rotAxes & AMJU_X  && m_rotAxes & AMJU_Z)
    {
      // Do nothing
    }
    else if (m_rotAxes & AMJU_X)
    {
      // Adxis should be (1, 0, 0)
      axis.z = 0;
    }
    else if (m_rotAxes & AMJU_Z)
    {
      // Axis should be (0, 0, 1)
      axis.x = 0;
    }

    // Check we will get an axis - i.e. there has to be some non-zero moment 
    if (axis.SqLen() > 0)
    {
      // Magnitude of torque
      float torque = sqrt(sqLenMoments); // TODO sin theta
      // TODO Should be len of axis, surely ??

      m_rotAxis = axis;
      m_rotAxis.Normalise();

      // Angular acceleration = torque / I  
      // (I = Moment Of Inertia, like mass for rotations)
      float accelMag = torque / m_inertia;
      m_angularAccel.SetAxisAngle(accelMag, m_rotAxis);
    }
  }

  ResetMoments();

  const Quaternion IDENT = Quaternion();
  Quaternion accFrac = Quaternion::Slerp(IDENT, m_angularAccel, dt);
  m_angularVel = accFrac * m_angularVel;

  Quaternion velFrac = Quaternion::Slerp(IDENT, m_angularVel, dt);
  m_quat = velFrac * m_quat;

  m_quat.Normalize();
  m_quat.CreateMatrix(&m_matrix);

  Matrix yRot;
  yRot.SetIdentity(); // TODO need this ?
  yRot.RotateY(DegToRad(m_yRot));
  m_matrix *= yRot;

  m_matrix.TranslateKeepRotation(m_pos);

  // Transform the collision mesh by the rotation for this frame
  Matrix qMat;
  velFrac.CreateMatrix(&qMat);
  // Reverse translation so we rotate about origin
  m_collMesh.Translate(-m_pos);
  // Perform rotation
  m_collMesh.Transform(qMat);
  // Move back to position
  m_collMesh.Translate(m_pos);

  // Calculate AABB for the collision mesh
  m_collMesh.CalcAABB(m_pSceneNode->GetAABB());

  // If the collision mesh AABB is too tall, we have reached the max rotation.
  // In this case, restore the old values for m_quat, m_matrix, m_collMesh, m_aabb
  if (m_pSceneNode->GetAABB()->GetYSize() > m_maxYSize)
  {
    m_angularVel = Quaternion();
    m_quat = oldQuat;
    m_matrix = oldMatrix;
    m_collMesh = oldCollMesh;
    *(m_pSceneNode->GetAABB()) = oldAabb;
  }

  m_pSceneNode->SetLocalTransform(m_matrix);
}

const Vec3f& Floor::GetHighPoint() const
{
 return m_highPoint;
}

void Floor::DrawCollisionMesh()
{
  m_collMesh.Draw();
}
}

