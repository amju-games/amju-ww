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
#include <ROConfig.h>
#include "GSMain.h"
#include "CursorManager.h"
#include "Floor.h"
#include "Player.h"
#include "Dino.h"
#include "Pet.h"
#include "Exit.h"
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
#include "Bird.h"

#ifdef _DEBUG
#define EDIT_CAM
#endif

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
  m_gui = WWLoadGui("main-gui.txt", false);
  Assert(m_gui);
  m_exitState = NOT_EXITED;
}

void GSMain::OnDeactive()
{
  GameState::OnDeactive();
  TheLurker::Instance()->SetAsListener(false);
  TheEventPoller::Instance()->RemoveListener(m_gui);
}

void GSMain::OnActive()
{
  GameState::OnActive();
  TheEventPoller::Instance()->AddListener(m_gui);

  TheLurker::Instance()->SetAsListener(true);

  TheSoundManager::Instance()->PlaySong("sound/apz2.it");

  SceneNode::SetGlobalShowAABB(s_showAABBs);

  TheCollisionManager::Instance()->GetCollisionDetector()->Clear();

  // Clear Text scene graph
  GetTextSceneGraph()->Clear();

  // Set clear colour for game, TODO depends on skybox
  //AmjuGL::SetClearColour(Colour(0.0f, 0.0f, 1.0f, 1.0f));

  m_exitState = NOT_EXITED;
  m_exitTimer = 0;

  GuiElement* splitLine = m_gui->GetElementByName("split-screen-line");
  Assert(splitLine);
  splitLine->SetVisible(TheScores::Instance()->GetNumPlayers() == 2);

  m_pauseButton = (GuiButton*)m_gui->GetElementByName("pause-button");
  Assert(m_pauseButton);
  m_pauseButton->SetCommand(OnPause);
  m_pauseButton->SetIsCancelButton(true);
  m_pauseButton->SetShowIfFocus(true);

  AmjuGL::SetClearColour(m_clearColour);
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
    GetGameSceneGraph()->SetCamera(new EditModeCamera(AMJU_EDITCAM_PERSP));
  }
#endif
  
  return false;
}

void GSMain::SetExitState(ExitState es)
{
  m_exitState = es;
  m_exitTimer = 0;
}

void GSMain::SetClearColour(const Colour& col)
{
  m_clearColour = col;
}

void GSMain::ClearLevel()
{
  OnFloor::ClearFloors();
  m_exitState = NOT_EXITED;
  m_exitTimer = 0;
}

void GSMain::Update()
{
  static Lurker* lurker = TheLurker::Instance();
  static Game* game = TheGame::Instance();
  SceneGraph* scenegraph = GetGameSceneGraph();

  lurker->Update();

  // Disable pause button if Lurk msg showing

  // Freeze if displaying tutorial text
  if (lurker->IsDisplayingMsg())
  {
    m_pauseButton->SetVisible(false);
    scenegraph->Update(); // DO still update the scene graph?
    // TODO Also still update Bird?
    GameObjects* objs = game->GetGameObjects();
    for (auto it = objs->begin(); it != objs->end(); ++it)
    {
      GameObject* obj = it->second;
      if (dynamic_cast<Bird*>(obj))
      {
        obj->Update();
      }
    }
  }
  else if (m_exitState == IS_EXITING)
  {
    m_pauseButton->SetVisible(false);
    scenegraph->Update(); // DO still update the scene graph?
    // TODO Also still update Bird?
    GameObjects* objs = game->GetGameObjects();
    for (auto it = objs->begin(); it != objs->end(); ++it)
    {
      GameObject* obj = it->second;
      if (dynamic_cast<Player*>(obj))
      {
        obj->Update();
      }
      Pet* pet = dynamic_cast<Pet*>(obj);
      if (pet && pet->IsTeleporting())
      {
        pet->Update();
      }
      if (dynamic_cast<Exit*>(obj))
      {
        obj->Update();
      }
    }
  }
  else
  {
    if (m_exitState == FINISHED_EXITING)
    {
      m_exitTimer += TheTimer::Instance()->GetDt();

      static const float EXIT_DELAY_2 = ROConfig()->GetFloat("exit-delay-2");

      if (m_exitTimer > EXIT_DELAY_2) 
      {
        game->SetCurrentState(TheGSLevelComplete::Instance());
      }
    }
    else
    {
      m_pauseButton->SetVisible(true);

      game->UpdateGameObjects();
      TheCollisionManager::Instance()->Update();
      scenegraph->Update();
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
