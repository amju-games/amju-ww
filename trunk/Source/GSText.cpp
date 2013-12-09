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
class StarEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewPos() const override
  {
    int i = (int)Rnd(20, 220);
    float r = (float)i * 0.005f; // radius
    float angle = (float)i * 0.6f;
    Vec3f tr(r * cos(angle), r * sin(angle), Rnd(-0.5, 0.5));
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
}

void GSText::Update()
{
  GetTextSceneGraph()->Update();

  m_timer += TheTimer::Instance()->GetDt(); 

  float b = sin(m_timer * 0.25f) * 0.25f + 0.75f;
  AmjuGL::SetClearColour(Colour(0, 0, b, 1.0f));
}

void GSText::Draw()
{
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  AmjuGL::SetIdentity();

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  AmjuGL::PushMatrix();
  Matrix mat;
  static float a = 0; 
  a += TheTimer::Instance()->GetDt();   // TODO CONFIG!!
  AmjuGL::RotateZ(a * 10.0f); // TODO TEMP TEST

  m_stars->Update();
  m_stars->Draw();
  AmjuGL::PopMatrix();

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_PROJECTION_MATRIX);
  const float FOVY = 60.0f;
  const float NEAR = 1.0f;
  const float FAR = 1000.0f;
  static const float aspect = (float)Screen::X() / (float)Screen::Y();
  AmjuGL::SetPerspectiveProjection(FOVY, aspect, NEAR, FAR);

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  //static float a = 0; 
  //// TODO CONFIG!!
  //a += TheTimer::Instance()->GetDt(); 
  //AmjuGL::LookAt(cos(a), 10.0f + sin(a), 6.0f,   0, 0, 0.0f,  0, 1.0f, 0);
  m_camera->SetEyePos(Vec3f(0, 10, 6)); //Vec3f(cos(a), 10.0f + sin(a), 6.0f)); 

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

  StarEffect* stars = new StarEffect;
  m_stars = stars;
  stars->Set("star1.png", 0.05f, 30, 99999.9f, -99999.9f);
  stars->Start();

//SceneNode;
  // TODO shouldn't this apply to all children??
//  m_stars->SetIsZWriteEnabled(false);
//  parent->AddChild(m_stars);
 
  // Add stars
/*
  ResourceManager* rm = TheResourceManager::Instance();
  ObjMesh* mesh = (ObjMesh*)rm->GetRes("star.obj");
  Texture* tex = (Texture*)rm->GetRes("flare.png");
  const float S = 1000.0f;

  int numStars = 100;
  for (int i = 10; i < numStars + 10; i++)
  {
    SceneMesh* sm = new StarMesh;
    sm->SetMesh(mesh);
    Matrix mat;
    float r = (float)i * 20.0f;
    float angle = (float)i * 0.6f;
    Vec3f tr(r * cos(angle), r * sin(angle), Rnd(-800, 200) - 400);
    mat.Translate(tr);

    float sc = Rnd(0.005f, 0.015f);
    Matrix mat2;
    mat2.Scale(sc, sc, sc);

    mat *= mat2;
    sm->SetLocalTransform(mat);
    AABB aabb(-S, S, -S, S, -S, S); 
    aabb.Translate(tr);
    sm->SetAABB(aabb);

    Billboard* bb = new Billboard;
    Assert(tex);
    bb->SetTexture(tex);
    bb->SetSize(Rnd(60.0f, 100.0f));
    bb->SetAABB(aabb);

    sm->AddChild(bb);
    m_stars->AddChild(sm);
  }
*/
}

bool GSText::OnBalanceBoardEvent(const BalanceBoardEvent& bbe)
{
  // Calibrate balance events
  Vec2f ucpos = bbe.GetUncalibratedCoord();
  BalanceBoardEvent::SetZeroCoords(ucpos.x, ucpos.y);
  return false; // not eaten
}

}
