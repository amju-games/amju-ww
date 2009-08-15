#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"

namespace Amju
{
GameObject* CreateSkybox() { return new Skybox; }
static bool reg = TheGameObjectFactory::Instance()->Add(Skybox::NAME, &CreateSkybox);

const char* Skybox::NAME = "skybox";

const char* Skybox::GetTypeName() const
{
  return NAME;
}

bool Skybox::Load(File* f)
{
  // Basic box for now
  if (!GameObject::Load(f))
  {
    return false;
  }

  m_mesh = LoadMeshResource(f);
  Assert(m_mesh);

  return true;
}

void Skybox::Draw()
{
  static float r = 0;
  static const float ROT_VEL = 1.0f;
  r += ROT_VEL * TheTimer::Instance()->GetDt();

  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();
  AmjuGL::RotateY(r);
  m_mesh->Draw();
  AmjuGL::PopMatrix();
}

void Skybox::Update()
{
  // TODO
}
}
