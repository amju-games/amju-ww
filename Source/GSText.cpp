#include <DegRad.h>
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

namespace Amju
{
bool TextStateListener::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  return m_textState->OnBalanceBoardEvent(bbe);
}

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
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();
  const float FOVY = 60.0f;
  const float NEAR = 1.0f;
  const float FAR = 1000.0f;
  static const float aspect = (float)Screen::X() / (float)Screen::Y();
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

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

  AmjuGL::SetClearColour(Colour(0, 0, 0, 1.0f));

  m_listener = new TextStateListener(this);
  TheEventPoller::Instance()->AddListener(m_listener);
}

void GSText::OnDeactive()
{
  GameState::OnDeactive();

  // DON'T unload scene
  //TheSceneGraph::Instance()->Clear();

  // remove listeners
  TheEventPoller::Instance()->RemoveListener(m_listener);
  m_listener = 0;

  if (m_gui)
  {
    TheEventPoller::Instance()->RemoveListener(m_gui);
  }
  m_gui = 0; 
}

class Reflect : public SceneNode
{
public:
  virtual void BeforeDraw()
  {
    PushColour();
    static const float s = 0.5f;
    MultColour(Colour(s, s, s, 1));
    AmjuGL::PushMatrix();
    // TODO Doesn't look right
    AmjuGL::Scale(1, -1, 1);
    AmjuGL::Translate(0, -2.0f, 0);
  }

  virtual void AfterDraw()
  {
    AmjuGL::PopMatrix();
    PopColour();
  }

};

void GSText::CreateText(const std::string& text)
{
  MyTextMaker tm;
  PSceneNode node = tm.MakeText(Lookup(text));

  // Rotate
  Matrix m;
  m.RotateX(DegToRad(10.0f));
  node->MultLocalTransform(m);
  // TODO Should combine ?
  node->CombineTransform();
  node->RecursivelyTransformAABB(m);

  SceneNode* parent = new SceneNode;
  parent->AddChild(node);
  parent->UpdateBoundingVol();

  
  // Reflection - TODO
//  Reflect* reflect = new Reflect;
//  parent->AddChild(reflect);
//  reflect->AddChild(node);
  

  GetTextSceneGraph()->SetRootNode(SceneGraph::AMJU_OPAQUE, parent);

  SceneNode* stars = new SceneNode;
  parent->AddChild(stars);
  m.RotateX(DegToRad(-60.0f));
  stars->MultLocalTransform(m);
 
  // Add stars
  ResourceManager* rm = TheResourceManager::Instance();
  ObjMesh* mesh = (ObjMesh*)rm->GetRes("star.obj");
  Matrix mat2;
  mat2.Scale(0.01f, 0.01f, 0.01f);
  const float S = 10.0f;

  int numStars = 100;
  for (int i = 0; i < numStars; i++)
  {
    SceneMesh* sm = new SceneMesh;
    sm->SetMesh(mesh);
    Matrix mat;
    float r = (float)i * 20.0f;
    float angle = (float)i * 0.6f;
    Vec3f tr(r * cos(angle), r * sin(angle), -80);
    mat.Translate(tr);
    mat *= mat2;
    sm->SetLocalTransform(mat);
    AABB aabb(-S, S, -S, S, -S, S); 
    aabb.Translate(tr);
    sm->SetAABB(aabb);
/*
  Billboard* bb = new Billboard;
  Texture* tex = (Texture*)rm->GetRes("flare.png");
  Assert(tex);
  bb->SetTexture(tex);
  bb->SetSize(1.0f);
  sm->AddChild(bb);
  bb->SetAABB(aabb);
*/

    stars->AddChild(sm);
  }
}

bool GSText::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Calibrate balance events
  Vec2f ucpos = bbe.GetUncalibratedCoord();
  BalanceBoardEvent::SetZeroCoords(ucpos.x, ucpos.y);
  return false; // not eaten
}

}
