#ifndef FLOOR_H
#define FLOOR_H

#include "Texture.h"
#include "WWGameObject.h"
#include "Vec2.h"
#include "Vec3.h"
#include "Quaternion.h"
#include "ObjMesh.h"
#include "Matrix.h"
#include "CollisionMesh.h"
#include "SceneMesh.h"

namespace Amju
{
// Floor for our balance game: tilts depending on axes of freedom, and the
//  moments acting on it
class Floor : public WWGameObject
{
public:
  static const char* NAME;

  Floor();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Update();
  virtual void Reset();
  virtual bool CreateSceneNode() override;
  virtual void AddToGame();
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

  // Get matrix - this is the rotation of the Floor
  Matrix* GetMatrix();

  // If (x, z) is on floor, get height and return true.
  bool GetY(const Vec2f& v, float* pY);

  // Set moment of each object - combined effect of all objects causes tilt
  void SetObjMassPos(float mass, const Vec3f& pos);

  CollisionMesh* GetCollisionMesh();

  const Vec3f& GetHighPoint() const;

  void DrawCollisionMesh();

protected:
  bool LoadMesh(File* f);
  bool SaveMesh(File* f);

private:
  // Called at start of update to reset all moments
  void ResetMoments();

protected:
  // Summed moments for this frame
  Vec3f m_moments;

  // Axis of rotation
  Vec3f m_rotAxis;

  // Angular acceleration about axis m_rotAxis
  Quaternion m_angularAccel;

  // Angular vel about axis m_rotAxis
  Quaternion m_angularVel;

  // Accumulated rotation over all frames
  Quaternion m_quat;

  // Quat converted to matrix - used for visual transform and to transform
  //  collision mesh
  Matrix m_matrix;

  // Used to calc height at (x, z), and for shadows
  RCPtr<CollisionMesh> m_collMesh;

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

  // Moment Of Inertia, like mass for rotations 
  float m_inertia;
};
}

#endif
