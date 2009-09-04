#ifndef BLOCK_H
#define BLOCK_H

#include "OnFloor.h"
#include "Matrix.h"

namespace Amju
{
class SceneMesh;

class Block : public OnFloor
{
public:
  static const char* NAME;

  Block();
  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File*);
//  virtual AABB* GetAABB(); 

protected:
  Matrix m_matrix;
  //SceneMesh* m_pSceneNode;
};
}

#endif

