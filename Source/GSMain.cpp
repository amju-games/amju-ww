#include "GSMain.h"
#include <AmjuGL.h>
#include "CursorManager.h"
#include <Game.h>
#include "Floor.h"
#include "Player.h"
#include "Dino.h"
#include <File.h>
#include <ReportError.h>
#include <GameObjectFactory.h>
#include <EventPoller.h>
#include "MySceneGraph.h"
#include "CollisionManager.h"
#include <Font.h>
#include <SceneNodeCamera.h>
#include "Camera.h"
#include <Timer.h>
#include <StringUtils.h>
#include <Pause.h>
#include <Screen.h>
#include "Hud.h"
#include "GSPaused.h"

namespace Amju
{
const char* GSMain::NAME = "main";

static bool b = TheGame::Instance()->AddState(GSMain::NAME, new GSMain);

GSMain::GSMain()
{
}

void GSMain::OnActive()
{
  GameState::OnActive();

  // Clear Text scene graph
  GetTextSceneGraph()->Clear();
}

void GSMain::OnKeyEvent(const KeyEvent& ke)
{
  if (ke.keyType == AMJU_KEY_ESC && !ke.keyDown)
  {
    TheGame::Instance()->SetCurrentState(GSPaused::NAME);
  }

  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
    (ke.key == 'd' || ke.key == 'D'))
  {
    TheResourceManager::Instance()->Dump();
  }

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
    PGameObject go1 = it->second;

    if (((WWGameObject*)go1.GetPtr())->IsDead())
    {
      continue;
    }

    Game::GameObjects::iterator jt = it;
    ++jt;
    for ( ; jt != gos->end(); ++jt)
    {
      PGameObject go2 = jt->second;
      
      AABB* aabb1 = go1->GetAABB();
      AABB* aabb2 = go2->GetAABB();

      if (aabb1 && aabb2 && aabb1->Intersects(*aabb2))
      {
        TheCollisionManager::Instance()->HandleCollision(go1, go2);
      }      
    }
  }
}

void GSMain::Update()
{
  TheGame::Instance()->UpdateGameObjects();

  GetGameSceneGraph()->Update();

  // Perform game-specific collision det & response here
  Collisions();
}

void GSMain::Draw2d()
{
  AmjuGL::Viewport(0, 0, Screen::X(), Screen::Y());
  TheHud::Instance()->Draw();

  // Split screen -- draw all screens
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
    AmjuGL::SetIdentity();

    TheViewportManager::Instance()->GetViewport(i)->Draw2d();
  }

  // TODO Draw borders ??
  /*
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  font->Print(-1, 1, "HELLO! I am a test");
  */
//  TheCursorManager::Instance()->Draw();
}

void GSMain::Draw()
{
  // Split screen -- draw all screens
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    TheViewportManager::Instance()->GetViewport(i)->Draw();
  }
}
}
