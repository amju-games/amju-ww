#include "GSText.h"
#include "CursorManager.h"
#include "SceneComposite.h"
#include "SceneMesh.h"
#include "SceneGraph.h"
#include "CollisionMesh.h"
#include "AABB.h"
#include "MyTextMaker.h"
#include "DegRad.h"
#include "Timer.h"

namespace Amju
{
GSText::GSText()
{
  m_timer = 0;
}

void GSText::Update()
{
  TheSceneGraph::Instance()->Update();
  m_timer += TheTimer::Instance()->GetDt(); 
}

void GSText::Draw()
{
  // Background ? -- Scene Skybox

  // TODO Camera node
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  AmjuGL::LookAt(0, 10, 10,   0, 0, 0.0f,  0, 1.0f, 0);

  // TODO Lighting node
  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);
  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(1, 1, 1)); // Light direction

  TheSceneGraph::Instance()->Draw();
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

  // unload scene
  TheSceneGraph::Instance()->Clear();
  m_gui = 0; // should remove itself as a listener
}

void GSText::CreateText(const std::string& text)
{
  MyTextMaker tm;
  PSceneNode node = tm.MakeText(text);

  // Rotate
  Matrix m;
  m.RotateX(DegToRad(60.0f));
  node->MultLocalTransform(m);
  // TODO Should combine ?
  node->CombineTransform();

  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, node);
}
}
