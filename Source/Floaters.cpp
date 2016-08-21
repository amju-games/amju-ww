#include <AmjuRand.h>
#include <File.h>
#include "Floaters.h"
#include "MySceneGraph.h"

namespace Amju
{
const char* Floaters::NAME = "floaters";

Vec3f FloaterParticleEffect::NewPos() const
{
  return Vec3f(rand() % 40 - 20, rand() % 4 + 1, rand() % 40 - 20);
}
  
Vec3f FloaterParticleEffect::NewVel() const 
{
//static const float PARTICLE_SPEED = 40.0f;
//static const float PARTICLE_GRAV = -10.0f;

//  return Vec3f(Rnd(-PARTICLE_SPEED, PARTICLE_SPEED), Rnd(0, PARTICLE_SPEED), Rnd(-PARTICLE_SPEED, PARTICLE_SPEED));

  return Vec3f(0, 0, 0);
}

Vec3f FloaterParticleEffect::NewAcc() const 
{
  return Vec3f(0, 0, 0);
}

void FloaterParticleEffect::UpdateParticle(Particle2d* p, float dt)
{
  const float TIME_MULT[] = { 1.f, .25f, -0.75f, -0.5f };
  
  int i = p->m_id & 3;
  p->m_time += dt * TIME_MULT[i];

  float t = p->m_time;
  float s = sin(t);
  float c = cos(t);
  p->m_pos += Vec3f(s, c, c);
}

const char* Floaters::GetTypeName() const 
{
  return NAME;
}

WWGameObject* Floaters::Clone()
{
  return new Floaters(*this);
}

bool Floaters::Save(File* f)
{
  return true;
}

void Floaters::AddPropertiesGui(PropertiesDialog* dlg)
{
}

PropertyValue Floaters::GetProp(PropertyKey)
{
  return PropertyValue();
}

void Floaters::SetProp(PropertyKey, PropertyValue)
{
}

bool Floaters::CreateSceneNode() 
{
  File effectFile;
  // For nested glue files to work, this should be last or destroyed before further reading
  // TODO Different effect files
  if (!effectFile.OpenRead("floater-effect.txt"))
  {
    effectFile.ReportError("Couldn't open bonus effect file");
    return false;
  }
  m_effect = new FloaterParticleEffect;
  if (!m_effect->Load(&effectFile))
  {
    effectFile.ReportError("Failed to load floater effect");
    return false;
  }

  m_effect->Start();

  m_effect->SetAABB(AABB()); //*(GetSceneNode()->GetAABB()));
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  Assert(root);
  root->AddChild(m_effect.GetPtr());
  m_effect->SetVisible(true);

  return true;
}

void Floaters::Update()
{
  m_effect->Update();
}

}

