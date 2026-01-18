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

  // Remove sybox added for previous states
  TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_SKYBOX, 0);
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
  /*
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");

  font->Print(-1, 1,  "some text");
  */

  TheCursorManager::Instance()->Draw();
}

void GSMain::Draw()
{
  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  TheSceneGraph::Instance()->Draw();
}
}
