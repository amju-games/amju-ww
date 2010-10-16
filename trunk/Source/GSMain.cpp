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
#include "Tutorial.h"
#include "GSLoadLevel.h"
#include "GSLevelComplete.h"

namespace Amju
{
const char* GSMain::NAME = "main";

GSMain::GSMain()
{
}

void GSMain::OnActive()
{
  GameState::OnActive();

  // Clear Text scene graph
  GetTextSceneGraph()->Clear();

  // Set clear colour for game, TODO depends on skybox
  TheGame::Instance()->SetClearColour(Colour(0.6f, 0.6f, 1.0f, 1.0f));

  m_exitReached = false;
  m_exitTimer = 0;

  // TODO Do all one-time init somewhere
  static bool first = true;
  if (first)
  {
    first = false;
    TheTutorial::Instance()->Load();
  }
}

void GSMain::OnKeyEvent(const KeyEvent& ke)
{
  if (ke.keyType == AMJU_KEY_ESC && !ke.keyDown && !m_exitReached)
  {
    TheGame::Instance()->SetCurrentState(TheGSPaused::Instance());
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
    TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
  }
}

void GSMain::OnExitReached()
{
  m_exitReached = true;
  m_exitTimer = 0;
}

void GSMain::ClearLevel()
{
  OnFloor::ClearFloors();
  m_exitReached = false;
  m_exitTimer = 0;
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

      if (((WWGameObject*)go2.GetPtr())->IsDead())
      {
        continue;
      }
      
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
  // Freeze if displaying tutorial text
  if (!TheTutorial::Instance()->IsActive())
  {
    if (m_exitReached)
    {
      m_exitTimer += TheTimer::Instance()->GetDt();
      if (m_exitTimer > 1.0f) // TODO CONFIG
      {
        TheGame::Instance()->SetCurrentState(TheGSLevelComplete::Instance());
      }
    }
    else
    {
      TheGame::Instance()->UpdateGameObjects();
      // Perform game-specific collision det & response here
      Collisions();
    }

    GetGameSceneGraph()->Update();
  }

  TheTutorial::Instance()->Update();
}

void Fps()
{
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  static int fps = 0;
  static float t = 0;
  static std::string s;

  fps++;
  t += TheTimer::Instance()->GetDt();
  if (t >= 1.0f)
  {
#ifdef FPS_DEBUG
    std::cout << "FPS: " << fps << "\n";
#endif

    s = ToString(fps);
    fps = 0;
    t = 0;
  }
  font->Print(-0.9f, 0.9f, s.c_str());
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

  Fps();
  // TODO Draw borders ??
  /*
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  font->Print(-1, 1, "HELLO! I am a test");
  */
//  TheCursorManager::Instance()->Draw();

  TheTutorial::Instance()->Draw();
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
