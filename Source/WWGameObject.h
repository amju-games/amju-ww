#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>
#include <SceneNode.h>
#include <Variable.h>

namespace Amju
{
class ObjMesh;

class PropertiesDialog;

// Properties, so levels can be edited in game
// For each type, Property Keys are unique IDs specifying each property.
typedef int PropertyKey; 
// Values for properties
typedef Variable PropertyValue;

class WWGameObject : public GameObject
{
public:
  WWGameObject();

  // For Edit mode
  virtual WWGameObject* Clone() = 0;
  virtual bool Save(File* f) = 0;
  virtual void Move(const Vec3f& deltaPos);
  virtual void Reset() override;

  // For this game, GameObjects for a level are created in "blocks".
  // The blocks are transformed, so the positions of the objects are
  // given relative to the local block origin. This matrix determines
  // the world coords of the object.
////  void SetTransform(const Matrix& mat);

  void SetDead(bool dead);
  bool IsDead() const;

  SceneNode* GetSceneNode();

  // Load does not add Game Object to Game immediately - call this to do so
  virtual void AddToGame();
  // For Edit Mode, to remove an object
  virtual void RemoveFromGame();

  // Set AABB around m_pos with extents xsize, ysize, zsize
  void RecalcAABB(); 

  virtual void RotateY(float angleDegs);

  // Properties
  virtual void AddPropertiesGui(PropertiesDialog* dlg) = 0;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);

protected:
  // Create appropriate scene node type, load mesh and texture, etc.
  // Override for special scene nodes types like characters.
  virtual bool CreateSceneNode();

  // Convenience functions for Load/Save
  bool LoadMeshResource(File*);
  bool SaveMeshResource(File*); // m_meshFilename must be set
  bool LoadShadow(File*);
  bool SaveShadow(File*);

protected:
////  Matrix m_mat;
  bool m_isDead;

  RCPtr<SceneNode> m_pSceneNode;

  Vec3f m_aabbExtents;
  bool m_extentsSet; // if set, use extents and recalc AABB

  std::string m_meshFilename;
  std::string m_shadowTexName;
  float m_shadowSize;

  Vec3f m_startPos;
};
}

#endif
