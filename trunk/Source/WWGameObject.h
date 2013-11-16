#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>
#include <SceneNode.h>

namespace Amju
{
class WWGameObject : public GameObject
{
public:
  WWGameObject();

  virtual bool Save(File* f) = 0;

  // For this game, GameObjects for a level are created in "blocks".
  // The blocks are transformed, so the positions of the objects are
  // given relative to the local block origin. This matrix determines
  // the world coords of the object.
  void SetTransform(const Matrix& mat);

  void SetDead(bool dead);
  bool IsDead() const;

  SceneNode* GetSceneNode();
  void AddSceneNode(); // Add scene node to graph - called by level loader etc

  // Set AABB around m_pos with extents xsize, ysize, zsize
  void RecalcAABB(); 

protected:
  Matrix m_mat;
  bool m_isDead;

  RCPtr<SceneNode> m_pSceneNode;

  Vec3f m_aabbExtents;
  bool m_extentsSet; // if set, use extents and recalc AABB
};
}

#endif
