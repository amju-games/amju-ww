#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>
#include <SceneNode.h>

namespace Amju
{
class ObjMesh;

class WWGameObject : public GameObject
{
public:
  WWGameObject();

  // For Edit mode
  virtual bool Save(File* f) = 0;
  virtual void Move(const Vec3f& deltaPos);
  virtual void Reset() override;

  // For this game, GameObjects for a level are created in "blocks".
  // The blocks are transformed, so the positions of the objects are
  // given relative to the local block origin. This matrix determines
  // the world coords of the object.
  void SetTransform(const Matrix& mat);

  void SetDead(bool dead);
  bool IsDead() const;

  SceneNode* GetSceneNode();

  // Load does not add Game Object to Game immediately - call this to do so
  virtual void AddToGame();
  // For Edit Mode, remove an object
  virtual void RemoveFromGame();

// Replacing:
////  void AddSceneNode(); // Add scene node to graph - called by level loader etc

  // Set AABB around m_pos with extents xsize, ysize, zsize
  void RecalcAABB(); 

protected:
  // Convenience functions for Load/Save
  ObjMesh* LoadMeshResource(File*);
  bool SaveMeshResource(File*); // m_meshFilename must be set
  bool LoadShadow(File*);
  bool SaveShadow(File*);

protected:
  Matrix m_mat;
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
