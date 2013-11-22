#ifndef SKYBOX_H
#define SKYBOX_H

#include "WWGameObject.h"
#include "EventListener.h"
#include "ObjMesh.h"

namespace Amju
{
class SceneMesh;

class Skybox : public WWGameObject
{
public:
  static const char* NAME;

  Skybox();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Update();
  virtual void AddToGame() override;
  virtual bool CreateSceneNode() override;

private:
  // TODO Visible meshes - bg and clouds, rotating at different rates..?
  PObjMesh m_mesh;
  float m_xRot;
  float m_yRot;
};
}

#endif
