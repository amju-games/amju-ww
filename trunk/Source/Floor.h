#ifndef FLOOR_H
#define FLOOR_H

#include "Texture.h"
#include "GameObject.h"
#include "Vec2.h"
#include "Vec3.h"
#include "Quaternion.h"
#include "ObjMesh.h"
#include "Matrix.h"
#include "CollisionMesh.h"
#include "SceneMesh.h"

namespace Amju
{
class Floor;

// Scene Node for floors 
class FloorMesh : public SceneMesh
{
public:
  FloorMesh(Floor* floor);
  virtual void Draw();
  void SetTexture(PTexture);

private:
  PTexture m_pTex;
  Floor* m_floor;
};

// Floor for a balance game: tilts depending on axes of freedom, and the
//  moments acting on it
class Floor : public GameObject
{
public:
  static const char* NAME;

  Floor();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual void Update();
  virtual void Reset();
  virtual AABB* GetAABB(); 

  // Get matrix - this is the rotation of the Floor
  Matrix* GetMatrix();

  // If (x, z) is on floor, get height and return true.
  bool GetY(const Vec2f& v, float* pY);

  // Set moment of each object - combined effect of all objects causes tilt
  void SetObjMassPos(float mass, const Vec3f& pos);

  const CollisionMesh& GetCollisionMesh() const;

  const Vec3f& GetHighPoint() const;

  void DrawCollisionMesh();

private:
  // Called at start of update to reset all moments
  void ResetMoments();

protected:
  // Summed moments for this frame
  Vec3f m_moments;

  // Axis of rotation
  Vec3f m_rotAxis;

  // Angular acceleration about axis m_rotAxis
  float m_angularAccel;

  // Angular vel about axis m_rotAxis
  float m_angularVel;

  // Accumulated rotation over all frames
  Quaternion m_quat;

  // Quat converted to matrix - used for visual transform and to transform
  //  collision mesh
  Matrix m_matrix;

  // Used to calc height at (x, z), and for shadows
  CollisionMesh m_collMesh;

  // Possible rotation axes
  static const unsigned int AMJU_NONE = 0;
  static const unsigned int AMJU_X = 0x01;
  static const unsigned int AMJU_Y = 0x02;
  static const unsigned int AMJU_Z = 0x04;

  // Combination of flags listed above
  unsigned int m_rotAxes;
  
  // Highest point on mesh
  Vec3f m_highPoint;

  // Max height of AABB - so determines the maximum rotation
  float m_maxYSize;

  // Point to scene node - Scene Graph owns it, this is not a leak!
  FloorMesh* m_pSceneNode;

  // Moment Of Inertia, like mass for rotations 
  float m_inertia;

  // Rotation - more for static floors, ramps etc
  float m_yRot;
};
}

#endif
