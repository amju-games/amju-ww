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

  void SetTransform(const Matrix& mat);

  void SetDead(bool dead);
  bool IsDead() const;

protected:
  Matrix m_mat;
  bool m_isDead;
};
}

#endif
