#ifndef SKYBOX_H
#define SKYBOX_H

#include "WWGameObject.h"
#include "EventListener.h"
#include "ObjMesh.h"

namespace Amju
{
class SceneMesh;

// Why TF is this an EventListener ????
// So we can rotate sky with mouse.. er, hmm
class Skybox : public WWGameObject, public EventListener
{
public:
  static const char* NAME;

  Skybox();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Update();

  virtual bool OnCursorEvent(const CursorEvent&);

private:
  // TODO Visible meshes - bg and clouds, rotating at different rates..?
  PObjMesh m_mesh;
  float m_xRot;
  float m_yRot;
};
}

#endif
