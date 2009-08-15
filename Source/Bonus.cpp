#include "Bonus.h"
#include "LoadVec3.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "Colour.h"

namespace Amju
{
const char* Bonus::NAME = "bonus";

GameObject* CreateBonus() { return new Bonus; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bonus::NAME, &CreateBonus);

Bonus::Bonus()
{
  m_isCollected = false;

  static const float XSIZE = 15.0f;
  static const float YSIZE = 30.0f;
  m_aabb.Set(
    -XSIZE, XSIZE, 
    0, YSIZE, 
    -XSIZE, XSIZE);
}

const char* Bonus::GetTypeName() const
{
  return NAME;
}

bool Bonus::Load(File* f)
{
  if (!GameObject::Load(f)) // Get ID
  {
    return false;
  }
  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected bonus position");
    return false;
  }
  m_aabb.Translate(m_pos);  

  m_mesh = LoadMeshResource(f);
  if (!m_mesh)
  {
    f->ReportError("Failed to load bonus mesh");
    return false;
  }
  // Load bonus points ?

  return true;
}

void Bonus::Draw()
{
  if (m_isCollected)
  {
    return;
  }

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();
  AmjuGL::Translate(m_pos.x, m_pos.y, m_pos.z);
  PushColour();
  MultColour(Colour(1, 0, 0, 1));
  m_mesh->Draw();
  PopColour();
  AmjuGL::PopMatrix();
  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);

  m_aabb.Draw();
}

void Bonus::Update()
{
  // Don't move with floor

  if (m_isCollected)
  {
    return;
  }
  // TODO Spin around
}

void Bonus::OnPlayerCollision()
{
  m_isCollected = true;
}
}
