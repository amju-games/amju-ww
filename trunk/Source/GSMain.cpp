#include <Game.h>
#include <AmjuGL.h>
#include <File.h>
#include <ReportError.h>
#include <GameObjectFactory.h>
#include <EventPoller.h>
#include <Font.h>
#include <SceneNodeCamera.h>
#include <Timer.h>
#include <StringUtils.h>
#include <Pause.h>
#include <Screen.h>
#include <SAP.h>
#include "GSMain.h"
#include "CursorManager.h"
#include "Floor.h"
#include "Player.h"
#include "Dino.h"
#include "MySceneGraph.h"
#include "CollisionManager.h"
#include "Camera.h"
#include "Hud.h"
#include "GSPaused.h"
#include "GSLoadLevel.h"
#include "GSLevelComplete.h"
#include "EditModeCamera.h"
#include "LurkMsg.h"
#include "Score.h"
#include "ShadowManager.h"
#include "WWLoadGui.h"

#define EDIT_CAM

namespace Amju
{
const char* GSMain::NAME = "main";
static bool s_showAABBs = false;

static void OnPause()
{
  TheGame::Instance()->SetCurrentState(TheGSPaused::Instance());
}

GSMain::GSMain()
{
  m_gui = WWLoadGui("main-gui.txt");
  Assert(m_gui);
}

void GSMain::OnActive()
{
  SceneNode::SetGlobalShowAABB(s_showAABBs);

  GameState::OnActive();

  TheCollisionManager::Instance()->GetCollisionDetector()->Clear();

  // Clear Text scene graph
  GetTextSceneGraph()->Clear();

  // Set clear colour for game, TODO depends on skybox
  AmjuGL::SetClearColour(Colour(0.6f, 0.6f, 1.0f, 1.0f));

  m_exitReached = false;
  m_exitTimer = 0;

  GuiElement* splitLine = m_gui->GetElementByName("split-screen-line");
  Assert(splitLine);
  splitLine->SetVisible(TheScores::Instance()->GetNumPlayers() == 2);

  GuiButton* pause = (GuiButton*)m_gui->GetElementByName("pause-button");
  Assert(pause);
  pause->SetCommand(OnPause);
}

bool GSMainEventListener::OnKeyEvent(const KeyEvent& ke)
{
/*
  if (ke.keyType == AMJU_KEY_ESC && !ke.keyDown && !m_exitReached)
  {
    TheGame::Instance()->SetCurrentState(TheGSPaused::Instance());
    return true;
  }
*/

  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
    (ke.key == 'a' || ke.key == 'A'))
  {
    s_showAABBs = !s_showAABBs;
    std::cout << "Show AABBs: " << s_showAABBs << "\n";
    SceneNode::SetGlobalShowAABB(s_showAABBs);
  }

  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
    (ke.key == 'd' || ke.key == 'D'))
  {
    TheResourceManager::Instance()->Dump();
    return true;
  }

  if (ke.keyType == AMJU_KEY_CHAR && 
      (ke.key == 'r' || ke.key == 'R'))
  {
    // Reset - may need to go back to load state
    TheGame::Instance()->SetCurrentState(TheGSLoadLevel::Instance());
    return true;
  }

#ifdef EDIT_CAM
  // Switch to debug camera
  if (ke.keyType == AMJU_KEY_CHAR && (ke.key == 'c' || ke.key == 'C'))
  {
    GetGameSceneGraph()->SetCamera(new EditModeCamera);
  }
#endif
  
  return false;
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

void GSMain::Update()
{
  static Lurker* lurker = TheLurker::Instance();
  lurker->Update();

  // Disable pause button if Lurk msg showing
  // Make member to avoid constant lookup TODO
  GuiButton* pauseButton = (GuiButton*)m_gui->GetElementByName("pause-button");

  // Freeze if displaying tutorial text
  if (lurker->IsDisplayingMsg())
  {
    pauseButton->SetIsEnabled(false);
  }
  else
  {
    pauseButton->SetIsEnabled(true);
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
      TheCollisionManager::Instance()->Update();
      GetGameSceneGraph()->Update();
      TheShadowManager::Instance()->Update();
    }
  }
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
  m_gui->Draw(); // split screen line etc

//  TheCursorManager::Instance()->Draw();

  TheLurker::Instance()->Draw();
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
