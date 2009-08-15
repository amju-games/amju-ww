#include "GSMain.h"
#include "AmjuGL.h"
#include "CursorManager.h"
#include "Game.h"
#include "Floor.h"
#include "Player.h"
#include "Dino.h"
#include "File.h"
#include "ReportError.h"
#include "GameObjectFactory.h"
#include "EventPoller.h"
#include "SceneGraph.h"
#include "SceneGameObject.h"
#include "SceneComposite.h"
#include "CollisionManager.h"
#include "Font.h"
#include "SceneNodeCamera.h"
#include "Camera.h"
#include "Timer.h"
#include "StringUtils.h"

namespace Amju
{
const char* GSMain::NAME = "balance";

static bool b = TheGame::Instance()->AddState(
  GSMain::NAME, new GSMain);

GSMain::GSMain()
{
}

void GSMain::OnActive()
{
  GameState::OnActive();
}

void GSMain::OnKeyEvent(const KeyEvent& ke)
{
  if (ke.keyType == AMJU_KEY_CHAR && 
      (ke.key == 'r' || ke.key == 'R'))
  {
    // Reset - may need to go back to load state
    Game::GameObjects* g = TheGame::Instance()->GetGameObjects();
    for (Game::GameObjects::iterator it = g->begin(); it != g->end(); ++it)
    {
      it->second->Reset();
    }
  }
}

void GSMain::ClearLevel()
{
  OnFloor::ClearFloors();
}

/*
// TODO Level load state
bool GSMain::LoadLevel()
{
  TheGame::Instance()->ClearGameObjects();
  OnFloor::ClearFloors();

  std::string levelfilename = "level-1.txt";

  File f;
  if (!f.OpenRead(levelfilename))
  {
    ReportError("Failed to open level file");
    return false;
  }

  int numObjects = 0;
  f.GetInteger(&numObjects);

  SceneNode* opaque = new SceneNode;
  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_OPAQUE, opaque);

  for (int i = 0; i < numObjects; i++)
  {
    std::string s;
    f.GetDataLine(&s);
    PGameObject pgo = TheGameObjectFactory::Instance()->Create(s);
    Assert(pgo);

    if (!pgo->Load(&f))
    {
      f.ReportError("Error loading object; type:" + s);
      return false;
    }

    std::string end;
    if (!f.GetDataLine(&end) || end != "end")
    {
      f.ReportError("Expected \"end\" after object; type: " + s);
      return false;
    }

////    pgo->AddToSceneGraph(); // ?????
    TheGame::Instance()->AddGameObject(pgo);

    SceneGameObjectOpaque* node = new SceneGameObjectOpaque(pgo);
    opaque->AddChild(node);
    // If camera, tell SceneGraph that this node is the camera
    Camera* camera = dynamic_cast<Camera*>(pgo.GetPtr());
    if (camera)
    {
      node->SetIsCamera(true);
      TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_CAMERA, node);
    }
    else
    {
      PSceneNode shadow = new SceneGameObjectBlended(pgo);
      node->AddChild(shadow);
    }
  }

  return true;
}
*/

void Collisions()
{
  // TODO Not cool

  Game::GameObjects* gos = TheGame::Instance()->GetGameObjects();  
  for (Game::GameObjects::iterator it = gos->begin(); it != gos->end(); ++it)
  {
    Game::GameObjects::iterator jt = it;
    ++jt;
    for ( ; jt != gos->end(); ++jt)
    {
      PGameObject go1 = it->second;
      PGameObject go2 = jt->second;
      if (go1->GetAABB().Intersects(go2->GetAABB()))
      {
        TheCollisionManager::Instance()->HandleCollision(go1, go2);
      }
    }
  }
}

void GSMain::Update()
{
  TheGame::Instance()->UpdateGameObjects();

  // Perform game-specific collision det & response here
  Collisions();
}

void GSMain::Draw2d()
{
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");

  static float t = 0;
  t += TheTimer::Instance()->GetDt();

  font->Print(-1, 1,  ToString(t, 2).c_str()); //"R to reset");

  TheCursorManager::Instance()->Draw();
}

void GSMain::Draw()
{
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  TheSceneGraph::Instance()->Draw();
}
}
