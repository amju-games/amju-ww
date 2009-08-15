#include <iostream>
#include <fstream>
#include "TestState.h"
#include "LeafLoader.h"
#include "ObjMesh.h"
#include "Game.h"
#include "Directory.h"
#include "StringUtils.h"
#include "CursorManager.h"
#include "Font.h"
#include "SceneGraph.h"
#include "SceneMesh.h"
#include "File.h"

namespace Amju
{
// TODO Used by Directory code
const char* APPLICATION_NAME = "balance";

const char* TestState::NAME = "test-state";

static bool b = TheGame::Instance()->AddState(TestState::NAME, new TestState);


void TestState::OnActive()
{
 //  LeafLoad("star.leaf"); 
/*  
  // Merge 2 obj files into one
  //for (char c = 'a'; c <= 'z'; c++)
  for (char c = '0'; c <= '9'; c++)
  {
    ObjMesh m1;
    m1.Load("font3d/" + std::string(1, c) + "1.obj");

    ObjMesh m2;
    m2.Load("font3d/" + std::string(1, c) + "2.obj");
    m1.Merge(m2);

    m1.Save("font3d/_" + std::string(1, c) + "_.obj");
  }
  exit(0);
*/

  GameState::OnActive();

  /*
  TheSceneGraph::Instance(); // make sure we have registered with factory
  PSceneNode scene = LoadScene("scene.txt");
  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, scene);
  */
  
/*
  // Get directory, load each file in turn
  std::vector<std::string> files;
  Dir("font3d/", &files, false);
  for (unsigned int i = 0; i < files.size(); i++)
  {
    const std::string& s = files[i];
    if (GetFileExt(s) == "leaf")
    {
      LeafLoad(s); 
    }
  }
*/  
}

void TestState::Draw()
{
  /*
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();
  AmjuGL::LookAt(0, 10, 10,   0, 0, 0.0f,  0, 1.0f, 0);

  AmjuGL::Enable(AmjuGL::AMJU_LIGHTING);

  AmjuGL::DrawLighting(
    AmjuGL::LightColour(0, 0, 0),
    AmjuGL::LightColour(0.2f, 0.2f, 0.2f), // Ambient light colour
    AmjuGL::LightColour(1, 1, 1), // Diffuse light colour
    AmjuGL::LightColour(1, 1, 1),
    AmjuGL::Vec3(1, 1, 1)); // Light direction

  AmjuGL::SetTextureMode(AmjuGL::AMJU_TEXTURE_SPHERE_MAP);

  static float a = 0;
  AmjuGL::RotateX(a);
  a += 0.2f;
  TheSceneGraph::Instance()->Draw();

  AmjuGL::SetTextureMode(AmjuGL::AMJU_TEXTURE_REGULAR);

  // Scaling breaks lighting because it fucks the normals ?????
//  AmjuGL::Scale(100, 100, 100);
 // m1.Draw();
//  m1.GetAABB.Draw();

//  m1.Draw();
*/
}

void TestState::Draw2d()
{
  float s = 0;
  AmjuGL::DrawLine(AmjuGL::Vec3(-1, s, 0), 
    AmjuGL::Vec3(1, s, 0));

  std::cout << "Hello\n";

  /*
//  Font* font = (Font*)TheResourceManager::Instance()->GetRes("font2d/cheri-font.font");
  Font* font = (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");

  font->Print(-1, 0.5,  "abcdefghijklmnopqrstuvwxyz");
  font->Print(-1, 0,    "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
  font->Print(-1, -0.5, "!\"£$%^&*()_-+=[{}#~:;@'<,>.?/");
  

  TheCursorManager::Instance()->Draw();
  */
}
}
