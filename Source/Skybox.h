#ifndef SKYBOX_H
#define SKYBOX_H

#include "GameObject.h"
#include "ObjMesh.h"

namespace Amju
{
class Skybox : public GameObject
{
public:
  static const char* NAME;

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual void Draw();
  virtual void Update();

private:
  // TODO Visible meshes - bg and clouds, rotating at different rates..?
  PObjMesh m_mesh;
};
}

#endif
