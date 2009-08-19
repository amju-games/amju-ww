#include "TextMaker.h"
#include "SceneComposite.h"
#include "SceneMesh.h"
#include "CollisionMesh.h"
#include "AABB.h"

namespace Amju
{
SceneNode* MakeChar(char k, float* width)
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

PSceneNode TextMaker::MakeText(const std::string& text)
{
  SceneNode* comp = new SceneNode;
  float xmax = 0;
  float x = 0;
  float y = 1.0f;
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
      //node->SetParent(comp);
      Matrix m;
      m.Translate(Vec3f(x, 0, y));
      node->SetLocalTransform(m);

      // Decorate node, e.g. colours, movement
      comp->AddChild(Decorate(node));
    }
    x += w;
    if (x > xmax)
    {
      xmax = x;
    }
  }
  // Centre TODO make optional; centre each line!
  Matrix m;
  m.Translate(Vec3f(xmax * -0.5f, 0, y * -0.5f));
  comp->SetLocalTransform(m);

  comp->CombineTransform();

  return comp;
}


}
