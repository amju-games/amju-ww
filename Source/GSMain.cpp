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
#include "MySceneGraph.h"
#include "SceneGameObject.h"
#include "CollisionManager.h"
#include "Font.h"
#include "SceneNodeCamera.h"
#include "Camera.h"
#include "Timer.h"
#include "StringUtils.h"
#include "Pause.h"

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

  // Clear Text scene graph
  GetTextSceneGraph()->Clear();

  // was:
  // Remove sybox added for previous states
  //TheSceneGraph::Instance()->SetRootNode(SceneGraph::AMJU_SKYBOX, 0);
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

static Vec3f rot;
void GSMain::OnRotationEvent(const RotationEvent& re)
{
  if (re.controller != 0)
  {
    return;
  }

  switch (re.axis)
  {
  case AMJU_AXIS_X:
    rot.x = re.degs;
    break;
  case AMJU_AXIS_Y:
    rot.y = re.degs;
    break;
  case AMJU_AXIS_Z:
    rot.z = re.degs;
    break;  
  }
}

void GSMain::Draw2d()
{
  // TODO Split screen -- draw all screens

  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");

  /*
  std::string s = "Rotation x: " + ToString(rot.x, 2) + 
    " y: " + ToString(rot.y, 2) + 
    " z: " + ToString(rot.z, 2);

  font->Print(-1, 1, s.c_str());
  */
  TheCursorManager::Instance()->Draw();
}

void GSMain::Draw()
{
  // TODO Split screen -- draw all screens

  AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
  AmjuGL::SetIdentity();

  GetGameSceneGraph()->Draw();
}
}
