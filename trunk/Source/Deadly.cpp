#include <GameObjectFactory.h>
#include "Deadly.h"

namespace Amju
{
GameObject* CreateDeadly() { return new Deadly; }
static bool reg = TheGameObjectFactory::Instance()->Add(Deadly::NAME, &CreateDeadly);

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

