#include "GSText.h"
#include "CursorManager.h"
#include "SceneComposite.h"
#include "SceneMesh.h"
#include "SceneGraph.h"
#include "CollisionMesh.h"
#include "AABB.h"
#include "MyTextMaker.h"
#include "DegRad.h"

namespace Amju
{
void GSText::Update()
{
  TheSceneGraph::Instance()->Update();
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
}

void GSText::OnDeactive()
{
  GameState::OnDeactive();

  // unload scene
  TheSceneGraph::Instance()->Clear();
  m_gui = 0; // should remove itself as a listener
}

/*
SceneNode* MyMakeChar(char k, float* width)
{
  if (k == ' ')
  {
    *width = 0.5f;
    return 0;
  }
  char c = tolower(k);

  std::string filename = "font3d/_" + std::string(1, c) + "_.obj";
  ObjMesh* mesh = (ObjMesh*)TheResourceManager::Instance()->GetRes(filename);
  if (!mesh)
  {
    return 0;
  }

  SceneMesh* meshNode = new SceneMesh;
  meshNode->SetMesh(mesh);

  // Calc width - TODO Use const array, this is stupidly time consuming
  CollisionMesh cm;
  mesh->CalcCollisionMesh(&cm);
  AABB aabb;
  cm.CalcAABB(&aabb);
  *width = aabb.GetXSize();

  return meshNode;
}
*/

void GSText::CreateText(const std::string& text)
{
/*  
  // TODO Put this code somewhere it can be reused

  SceneNode* comp = new SceneNode;
  float xmax = 0;
  float x = 0;
  float y = 0;
  for (unsigned int i = 0; i < text.size(); i++)
  {
    char c = text[i];
    if (c == '\n')
    {
      x = 0;
      y += 2.0f; // TODO CONFIG
      continue;
    }
    float w = 0;
    SceneNode* node = MakeChar(c, &w);
    if (node)
    {
      node->SetParent(comp);
      Matrix m;
      m.Translate(Vec3f(x, 0, y));
      node->SetLocalTransform(m);

      // TODO Decorate node, e.g. colours, movement

      comp->AddChild(node);
    }
    x += w;
    if (x > xmax)
    {
      xmax = x;
    }
  }
  // Centre TODO make optional; centre each line!
  Matrix m;
  m.Translate(Vec3f(xmax * -0.5f, 0, 0));
  comp->SetLocalTransform(m);

  comp->CombineTransform();
  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, comp);
*/  

  MyTextMaker tm;
  PSceneNode node = tm.MakeText(text);

  /*
  // Rotate
  Matrix m;
  m.RotateX(DegToRad(60.0f));
  node->SetLocalTransform(m);
  // TODO Should combine ?
  */

  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, node);
}
}
