#include "Exit.h"
#include "Game.h"
#include "GSLevelComplete.h"
#include "LoadMeshResource.h"
#include "GameObjectFactory.h"
#include "LoadVec3.h"
#include "Timer.h"
#include "DegRad.h"
#include "Colour.h"
#include "GSLoadLevel.h"
#include "TextMaker.h"

namespace Amju
{
GameObject* CreateExit() { return new Exit; }
static bool reg = TheGameObjectFactory::Instance()->Add(Exit::NAME, &CreateExit);

const char* Exit::NAME = "exit";

Exit::Exit()
{
  m_isActive = false;
  m_activeTime = 0;
  m_rotate = 0;

  // Set AABB size
  static const float XSIZE = 20.0f;
  static const float YSIZE = 60.0f;
  m_aabb.Set(
    -XSIZE, XSIZE, 
    0, YSIZE, 
    -XSIZE, XSIZE);
}

const char* Exit::GetTypeName() const
{
  return NAME;
}

void Exit::Reset()
{
  m_isActive = false;
}

void Exit::Draw()
{
  if (!m_isActive)
  {
    // Exits are translucent until activated
    PushColour();
    MultColour(Colour(1.0f, 1.0f, 1.0f, 0.25f));
  }

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::PushMatrix();
  AmjuGL::Translate(m_pos.x, m_pos.y, m_pos.z);

  AmjuGL::PushMatrix();
  float dt = TheTimer::Instance()->GetDt();
  static const float ROT_SPEED = 3.0f;
  m_rotate += ROT_SPEED * dt;
  AmjuGL::RotateY(RadToDeg(m_rotate));

  m_mesh->Draw();
  AmjuGL::PopMatrix(); // dont rotate the next level number

  // Draw exit number - TODO centred in X
  AmjuGL::Translate(0, 30.0f, 0);
  AmjuGL::RotateX(90.0f);
  AmjuGL::Scale(20, 20, 20);
  m_text->DrawChildren();
  AmjuGL::PopMatrix();

  if (!m_isActive)
  {
    PopColour();
  }

  if (m_isActive)
  {
    m_billboard.Draw();
    m_effect.Draw();
  }

  m_aabb.Draw();
}

void Exit::Update()
{
  GameObject::Update();
  if (m_isActive)
  {
    m_activeTime += TheTimer::Instance()->GetDt();
    m_billboard.Update(); 
    m_effect.Update();
  }
}

bool Exit::Load(File* f)
{
  if (!GameObject::Load(f)) // Get ID
  {
    return false;
  }
  // Load position
  if (!LoadVec3(f, &m_pos))
  {
    f->ReportError("Expected exit position");
    return false;
  }
  m_aabb.Translate(m_pos);  

  m_mesh = LoadMeshResource(f);
  if (!m_mesh)
  {
    f->ReportError("Failed to load exit mesh");
    return false;
  }

  // Load next level
  if (!f->GetDataLine(&m_toLevel))
  {
    f->ReportError("Expected next level");
    return false;
  }
  TextMaker tm;
  m_text = tm.MakeText(m_toLevel);

  if (!m_billboard.Load(f))
  {
    f->ReportError("Failed to load exit billboard");
    return false;
  }
  Matrix mat;
  mat.Translate(m_pos);
  m_billboard.SetLocalTransform(mat);

  if (!m_effect.Load(f))
  {
    f->ReportError("Failed to load exit effect");
    return false;
  }

  return true;
}

void Exit::OnPlayerCollision()
{
  if (m_isActive && 
      m_activeTime > 2.0f) // TODO CONFIG
  {
    // Go to next level
    // TODO Sound effect, explosion etc

    // Set next level
    ((GSLoadLevel*)TheGame::Instance()->GetState(GSLoadLevel::NAME).GetPtr())->
      SetLevel(m_toLevel);

    TheGame::Instance()->SetCurrentState(GSLevelComplete::NAME);
  }
}

static float rnd(float f)
{
  return ((float)rand() / (float)RAND_MAX * 2.0f * f - f);
}

static const float PARTICLE_SPEED = 300.0f;

Vec3f ExitParticleEffect::NewVel()
{
  // z always towards us, or will be hidden by billboard
  return Vec3f(
    rnd(PARTICLE_SPEED), 
    rnd(PARTICLE_SPEED),
    (float)rand() / (float)RAND_MAX * PARTICLE_SPEED);
}

float ExitParticleEffect::NewTime()
{
  return (float)rand() / (float)RAND_MAX * 2.0f;
}

void ExitParticleEffect::HandleDeadParticle(Particle2d* p)
{
  p->m_pos = Vec3f(m_local[12], m_local[13], m_local[14]);
  p->m_time = NewTime();
}

void Exit::SetActive()
{
  if (m_isActive)
  {
    return;
  }

  m_isActive = true;
  m_activeTime = 0;
  // Visual effect
  Matrix mat;
  mat.Translate(m_pos);
  m_effect.SetLocalTransform(mat);
  m_effect.Start();
}
}
