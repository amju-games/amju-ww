#include <GameObjectFactory.h>
#include <DegRad.h>
#include "Bird.h"
#include "AIFly.h"
#include "Player.h"

namespace Amju
{
const char* Bird::NAME = "bird";

GameObject* CreateBird() { return new Bird; }
static bool reg = TheGameObjectFactory::Instance()->Add(Bird::NAME, &CreateBird);

static const float XSIZE = 15.0f;
static const float YSIZE = 20.0f;

Bird::Bird()
{
  m_aabbExtents = Vec3f(XSIZE, YSIZE, XSIZE);
  m_extentsSet = true;

  AddAI(new AIFly);
}

void Bird::AddToGame() 
{
  Npc::AddToGame();
}

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
  SetAI(AIFly::NAME); 
  if (m_ai)
  {
    Player* p = Player::GetPlayer(AMJU_P1);
    Assert(p);
    m_ai->SetTarget(p);
    m_ai->Update();
  }

  // Not
  //  Npc::Update();
  // .. because doesn't fall!

  OnFloorCharacter::Update();
 
  Matrix scale;
  const float BIRD_SCALE = 0.25f;
  scale.Scale(BIRD_SCALE, BIRD_SCALE, BIRD_SCALE); 
  Matrix mat;
  mat.RotateY(DegToRad(m_dirCurrent));
  mat = scale * mat;
  mat.TranslateKeepRotation(m_pos);
  m_pSceneNode->SetLocalTransform(mat);
}

}
