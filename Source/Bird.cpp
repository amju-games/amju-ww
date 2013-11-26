#include <GameObjectFactory.h>
#include "Bird.h"

namespace Amju
{
const char* Bird::NAME = "bird";

GameObject* CreateBird() { return new Bird; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bird::NAME, &CreateBird);

const char* Bird::GetTypeName() const
{
  return NAME;
}

WWGameObject* Bird::Clone()
{
  return new Bird(*this);
}

bool Bird::Load(File* f)
{
  if (!Npc::Load(f))
  {
    return false;
  }
  m_startPos = m_pos;
  m_md2Name = "pz-bird.md2";

  // TODO Diff colours
  m_texNames[0] = "bird1a.png";
  m_texNames[1] = "bird1.png";

  if (!LoadShadow(f))
  {
    return false;
  }
  return true;
}

bool Bird::Save(File* f)
{
  if (!Npc::Save(f))
  {
    return false;
  }
 
  return SaveShadow(f);
}

void Bird::Update()
{
  Npc::Update();
  SetAnim("fly");
}

}
