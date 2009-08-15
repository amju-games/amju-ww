#ifndef BLOCK_H
#define BLOCK_H

#include "OnFloor.h"
#include "ObjMesh.h"

namespace Amju
{
class Block : public OnFloor
{
public:
  static const char* NAME;

  Block();
  virtual const char* GetTypeName() const;
  virtual void Draw();
  virtual void Update();
  virtual bool Load(File*);

protected:
  PObjMesh m_mesh;
  Matrix m_matrix;
};
}

#endif

