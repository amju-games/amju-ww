#include "GSText.h"
#include "CursorManager.h"
#include "SceneMesh.h"
#include "MySceneGraph.h"
#include "CollisionMesh.h"
#include "AABB.h"
#include "MyTextMaker.h"
#include "DegRad.h"
#include "Timer.h"
#include <Localise.h>

namespace Amju
{
GSText::GSText()
{
  m_timer = 0;
}

void GSText::Update()
{
  GetTextSceneGraph()->Update();

  m_timer += TheTimer::Instance()->GetDt(); 
}

void GSText::Draw()
{
  // Background ? -- Scene Skybox

  // TODO Camera node
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  static float a = 0; 
  // TODO CONFIG!!
  a += TheTimer::Instance()->GetDt(); 
  AmjuGL::LookAt(cos(a), 10.0f + sin(a), 6.0f,   0, 0, 0.0f,  0, 1.0f, 0);

  // TODO Lighting node
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
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
}

void GSText::OnDeactive()
{
  GameState::OnDeactive();

  // DON'T unload scene
  //TheSceneGraph::Instance()->Clear();
  m_gui = 0; // should remove itself as a listener
}

void GSText::CreateText(const std::string& text)
{
  MyTextMaker tm;
  PSceneNode node = tm.MakeText(Lookup(text));

  // Rotate
  Matrix m;
  m.RotateX(DegToRad(60.0f));
  node->MultLocalTransform(m);
  // TODO Should combine ?
  node->CombineTransform();

  GetTextSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, node);
}
}
