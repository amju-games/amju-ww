#ifndef BONUS_H
#define BONUS_H

#include "OnFloor.h"
#include "ObjMesh.h"

namespace Amju
{
// Float in the air - don't move with any floor, but do cast a shadow
class Bonus : public OnFloor
{
public:
  static const char* NAME;

  Bonus();
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual void Draw();
  virtual void Update(); // Don't move with floor

  void OnPlayerCollision();

protected:
  bool m_isCollected;
  PObjMesh m_mesh; // Don't use MD2
};
}

#endif

