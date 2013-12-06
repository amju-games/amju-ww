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
#include <SoundManager.h>
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
#include "Viewport.h"
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
  TheSoundManager::Instance()->PlaySong("sound/apz2.it");

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

  m_pauseButton = (GuiButton*)m_gui->GetElementByName("pause-button");
  Assert(m_pauseButton);
  m_pauseButton->SetCommand(OnPause);
  m_pauseButton->SetIsCancelButton(true);
  m_pauseButton->SetShowIfFocus(true);
}

bool GSMain::OnKeyEvent(const KeyEvent& ke)
{
#ifdef _DEBUG
  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
    (ke.key == 'a' || ke.key == 'A'))
  {
    s_showAABBs = !s_showAABBs;
    std::cout << "Show AABBs: " << s_showAABBs << "\n";
    SceneNode::SetGlobalShowAABB(s_showAABBs);
  }
#endif

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

  // Freeze if displaying tutorial text
  if (lurker->IsDisplayingMsg())
  {
    m_pauseButton->SetVisible(false);
  }
  else
  {
    m_pauseButton->SetVisible(true);
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
