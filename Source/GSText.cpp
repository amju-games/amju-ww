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
#include "Stars.h"

namespace Amju
{
GSText::GSText()
{
  m_timer = 0;
  m_starRotVel = 1.0;
  m_yPos = 0;
  m_yVel = 0;
  m_nextState = 0;
  m_nextTimer = 0;
}

void GSText::GoToNewState(GameState* gs)
{
  m_nextState = gs;
  m_nextTimer = 0;
}

void GSText::Update()
{
  GetTextSceneGraph()->Update();

  float dt = TheTimer::Instance()->GetDt(); 
  m_timer += dt;
  if (m_nextState)
  {
    m_nextTimer += dt;
    if (m_nextTimer > 0.6f) // TODO
    {
      TheGame::Instance()->SetCurrentState(m_nextState);
    }
  }

  //float b = sin(m_timer * 0.25f) * 0.25f + 0.5f;
  //AmjuGL::SetClearColour(Colour(0, 0, 0, 1)); //b * 0.25f, 1.0f));
}

void GSText::Draw()
{
  const float aspect = (float)Screen::X() / (float)Screen::Y();

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  AmjuGL::SetPerspectiveProjection(45.0f, aspect, 1.0f, 2.0f);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_WRITE);
 
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

  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_READ);
  AmjuGL::Enable(AmjuGL::AMJU_DEPTH_WRITE);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f;
  const float FAR = 1000.0f;
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  static const float ACC = -100.0f;
  float dt = TheTimer::Instance()->GetDt(); 
  m_yVel += ACC * dt;
  m_yPos += m_yVel * dt;
  // If new state, send them down
  if (m_yPos < 0 && !m_nextState)
  {
    m_yPos = 0;
    m_yVel *= -0.5f;
  }

  m_camera->SetEyePos(Vec3f(0, 12, 1)); 
  // or e.g. 
  //  Vec3f(cos(a), 10.0f + sin(a), 6.0f)); 
  // for more movement

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.9f, 0.9f, 0.9f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(0, 1, 1)); // Light direction

  AmjuGL::Translate(0, m_yPos, 0);

  GetTextSceneGraph()->Draw();
}

void GSText::Draw2d()
{
  if (m_gui)
  {
    m_gui->Draw();
  }

#ifdef GEKKO
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_READ);
  TheCursorManager::Instance()->Draw();
  AmjuGL::Disable(AmjuGL::AMJU_DEPTH_WRITE);
#endif
}

void GSText::OnActive()
{
  GameState::OnActive();
  m_timer = 0;
  m_yPos = 10.0f; // TODO CONFIG
  m_yVel = 0;
  m_starRotVel = 1.0f; // TODO CONFIG
  AmjuGL::SetClearColour(Colour(0.5f, 0.5f, 1, 1)); 
  m_nextState = 0;
  m_nextTimer = 0;
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

  m_stars[0] = CreateStars("star1.png", 0.05f, 50, 99999.9f, -99999.9f);
  m_stars[1] = CreateStars("flare.png", 0.07f, 50, 99999.9f, -99999.9f);
}

bool GSText::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Calibrate balance events
  Vec2f ucpos = bbe.GetUncalibratedCoord();
  BalanceBoardEvent::SetZeroCoords(ucpos.x, ucpos.y);

#ifdef CALIBRATE_DEBUG  
std::cout << "Calibrating: X: " << ucpos.x << " Y: " << ucpos.y << "\n";
#endif

  return false; // not eaten
}

}
