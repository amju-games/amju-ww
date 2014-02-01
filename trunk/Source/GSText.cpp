#include <iostream>
#include <DegRad.h>
#include <AmjuRand.h>
#include <Timer.h>
#include <Localise.h>
#include <Screen.h>
#include <Game.h>
#include <EventPoller.h>
#include <Billboard.h>
#include "GSText.h"
#include "CursorManager.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "CollisionMesh.h"
#include "AABB.h"
#include "MyTextMaker.h"
#include "ParticleEffect2d.h"

namespace Amju
{
static int s_starId = 0;

class StarEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewPos() const override
  {
    int i = s_starId + 10;
    s_starId++;

    float r = (float)i * 0.02f; // radius
    float angle = (float)i * 0.6f;
    Vec3f tr(r * cos(angle), r * sin(angle), Rnd(-2.0f, -1.0f));
    return tr;
  }

  virtual float NewRot() const
  {
    return Rnd(-6.0f, 6.0f);
  }

  virtual float NewRotVel() const
  {
    return Rnd(-2.0f, 2.0f);
  }
};

GSText::GSText()
{
  m_timer = 0;
  m_starRotVel = 1.0;
}

void GSText::Update()
{
  GetTextSceneGraph()->Update();

  m_timer += TheTimer::Instance()->GetDt(); 

  float b = sin(m_timer * 0.25f) * 0.25f + 0.5f;
  AmjuGL::SetClearColour(Colour(0, 0,0, 1)); //b * 0.25f, 1.0f));
}

void GSText::Draw()
{
  const float aspect = (float)Screen::X() / (float)Screen::Y();

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  AmjuGL::SetPerspectiveProjection(45.0f, aspect, 1.0f, 2.0f);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  Matrix mat;
  static float a = 0; 
  a += TheTimer::Instance()->GetDt() * m_starRotVel;   
  AmjuGL::RotateZ(a * 5.0f); // TODO TEMP TEST

  for (int i = 0; i < 2; i++)
  {
    if (m_stars[i])
    {
      m_stars[i]->Update();
      m_stars[i]->Draw();
    }
  }

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f;
  const float FAR = 1000.0f;
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  m_camera->SetEyePos(Vec3f(0, 8, 1)); 
  // or e.g. 
  //  Vec3f(cos(a), 10.0f + sin(a), 6.0f)); 
  // for more movement

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.7f, 0.7f, 0.7f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(1, 1, 1)); // Light direction

  GetTextSceneGraph()->Draw();
}

void GSText::Draw2d()
{
  if (m_gui)
  {
    m_gui->Draw();
  }

  TheCursorManager::Instance()->Draw();
}

void GSText::OnActive()
{
  GameState::OnActive();
  m_timer = 0;
  m_starRotVel = 1.0f; // TODO CONFIG
}

void GSText::OnDeactive()
{
  GameState::OnDeactive();

  // DON'T unload scene - why??
  //TheSceneGraph::Instance()->Clear();

  // remove listeners
  if (m_gui)
  {
    TheEventPoller::Instance()->RemoveListener(m_gui);
  }
  m_gui = 0; 
}

void GSText::CreateText(const std::string& text)
{
  MyTextMaker tm;
  PSceneNode node = tm.MakeText(Lookup(text));

  // Rotate
  Matrix m;
  m.RotateX(DegToRad(10.0f));
  node->MultLocalTransform(m);

  // TODO Should combine ?
  //  node->CombineTransform(); - hmm, this must be being called elsewhere
  node->RecursivelyTransformAABB(m);

  SceneNode* parent = new SceneNode;
  parent->AddChild(node);
  parent->UpdateBoundingVol();
  
  SceneGraph* g = GetTextSceneGraph();
  g->Clear();
  m_camera = new SceneNodeCamera;
  g->SetCamera(m_camera);
  g->SetRootNode(SceneGraph::AMJU_OPAQUE, parent);

  srand(0); // 2 particle effects which we want to overlap - so set seed the same twice
  s_starId = 0;
  StarEffect* stars = new StarEffect;
  stars->Set("star1.png", 0.05f, 50, 99999.9f, -99999.9f);
  stars->Start();
  srand(0);
  s_starId = 0;
  StarEffect* stars2 = new StarEffect;
  stars2->Set("flare.png", 0.07f, 50, 99999.9f, -99999.9f);
  stars2->Start();
  m_stars[0] = stars;
  m_stars[1] = stars2;
}

bool GSText::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Calibrate balance events
  Vec2f ucpos = bbe.GetUncalibratedCoord();
  BalanceBoardEvent::SetZeroCoords(ucpos.x, ucpos.y);
  return false; // not eaten
}

}
