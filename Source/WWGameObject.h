#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>

namespace Amju
{
class WWGameObject : public GameObject
{
public:
  WWGameObject();

  // For this game, GameObjects for a level are created in "blocks".
  // The blocks are transformed, so the positions of the objects are
  // given relative to the local block origin. This matrix determines
  // the world coords of the object.
  void SetTransform(const Matrix& mat);

  void SetDead(bool dead);
  bool IsDead() const;

protected:
  Matrix m_mat;
  bool m_isDead;
};
}

#endif
