#include "Skybox.h"
#include "GameObjectFactory.h"
#include "Timer.h"
#include "LoadMeshResource.h"
#include "EventPoller.h"

//#define MOUSE_MOVE_SKYBOX

namespace Amju
{
GameObject* CreateSkybox() { return new Skybox; }
static bool reg = TheGameObjectFactory::Instance()->Add(Skybox::NAME, &CreateSkybox);

const char* Skybox::NAME = "skybox";

Skybox::Skybox()
{
  m_xRot = 0;
  m_yRot = 0;

#ifdef MOUSE_MOVE_SKYBOX
  TheEventPoller::Instance()->AddListener(this);
#endif
}

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

void Skybox::OnCursorEvent(const CursorEvent& ce)
{
  static float oldx = ce.x;
  static float oldy = ce.y;
  float xdiff = ce.x - oldx;
  float ydiff = ce.y - oldy;
  oldx = ce.x;
  oldy = ce.y;

  m_yRot += xdiff;
  m_xRot += ydiff;
}

void Skybox::Draw()
{
  static const float ROT_VEL = 2.0f; // degs/dec
  m_yRot += ROT_VEL * TheTimer::Instance()->GetDt();

  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();

  AmjuGL::RotateX(m_xRot);
  AmjuGL::RotateY(m_yRot);
  m_mesh->Draw();

  AmjuGL::PopMatrix();
}

void Skybox::Update()
{
  // TODO
}
}
