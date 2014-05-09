#include <GameObjectFactory.h>
//#include <LoadVec3.h>
//#include <CollisionMesh.h>
//#include <File.h>
//#include <SceneMesh.h>
//#include <ObjMesh.h>
#include "Deadly.h"
#include "PropertiesDialog.h"
#include "PropertyKeys.h"

namespace Amju
{
GameObject* CreateDeadly() { return new Deadly; }

#ifdef GLOBAL_INIT
static bool reg = TheGameObjectFactory::Instance()->Add(Deadly::NAME, &CreateDeadly);
#endif

const char* Deadly::NAME = "deadly";

static const float XSIZE = 20.0f;
static const float YSIZE = 20.0f;
static const float ZSIZE = 20.0f;

Deadly::Deadly()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, ZSIZE);
  m_extentsSet = true;
}

const char* Deadly::GetTypeName() const
{
  return NAME;
}

WWGameObject* Deadly::Clone() 
{
  return new Deadly(*this);
}

}

