#ifndef LEAF_LOAD_STATE_H
#define LEAF_LOAD_STATE_H

#include "GameState.h"
#include "ObjMesh.h"

namespace Amju
{
class TestState : public GameState
{
public:
  static const char* NAME;
  virtual void OnActive();
  virtual void Update() {}
  virtual void Draw();
  virtual void Draw2d();

protected:
  PObjMesh m_mesh;
};
}

#endif

