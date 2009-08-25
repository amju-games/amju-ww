#include "Bonus.h"
#include "LoadVec3.h"
#include "GameObjectFactory.h"
#include "File.h"
#include "LoadMeshResource.h"
#include "Colour.h"
#include "Timer.h"
#include "SoundManager.h"

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

  m_yRot = (float)(rand() % 180);
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
  File effectFile;
  if (!effectFile.OpenRead("bonus-effect.txt"))
  {
    effectFile.ReportError("Couldn't open bonus effect file");
    return false;
  }
  if (!m_effect.Load(&effectFile))
  {
    effectFile.ReportError("Failed to load bonus effect");
    return false;
  }

  return true;
}

void Bonus::Draw()
{
  m_effect.Draw();

  if (m_isCollected)
  {
    return;
  }

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();
  AmjuGL::Translate(m_pos.x, m_pos.y, m_pos.z);
  AmjuGL::RotateY(m_yRot);
  PushColour();
  MultColour(Colour(1, 0, 0.5f, 1));
  m_mesh->Draw();
  PopColour();
  AmjuGL::PopMatrix();
  AmjuGL::Disable(AmjuGL::AMJU_LIGHTING);

  m_aabb.Draw();
}

void Bonus::Update()
{
  m_effect.Update();

  // Don't move with floor
  if (m_isCollected)
  {
    return;
  }
  // Spin around
  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 360.0f;
  m_yRot += ROT_SPEED * dt;
}

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

static const float PARTICLE_SPEED = 200.0f;

Vec3f BonusParticleEffect::NewVel()
{
  return Vec3f(rnd(PARTICLE_SPEED), rnd(PARTICLE_SPEED), rnd(PARTICLE_SPEED));
}

Vec3f BonusParticleEffect::NewAcc()
{
  return Vec3f(0, -PARTICLE_SPEED, 0); // gravity
}

void Bonus::OnPlayerCollision()
{
  if (m_isCollected)
  {
    return;
  }

  m_isCollected = true;

  Matrix mat;
  mat.Translate(m_pos);
  m_effect.SetLocalTransform(mat);
  m_effect.Start(); 

  TheSoundManager::Instance()->PlayWav("cashreg"); // NB No file ext
  TheSoundManager::Instance()->PlayWav("bonus_points"); // NB No file ext
}
}
