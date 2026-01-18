#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>

namespace Amju
{
class WWGameObject : public GameObject
{
public:
  void SetTransform(const Matrix& mat);

protected:
  Matrix m_mat;
};
}

#endif
