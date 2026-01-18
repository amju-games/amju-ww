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
#include <Game.h>
#include "GSMain.h"
#include "Bird.h"
#include "CollisionManager.h"
#include "CursorManager.h"
#include "GSPaused.h"
#include "GSLoadLevel.h"
#include "GSLevelComplete.h"
#include "Depth.h"
#include "Describe.h"
#include "Dino.h"
#include "EditModeCamera.h"
#include "Exit.h"
#include "Floor.h"
#include "Hud.h"
#include "LurkMsg.h"
#include "NetSend.h"
#include "Pet.h"
#include "Player.h"
#include "PowerUp.h"
#include "ProcGen.h"
#include "MySceneGraph.h"
#include "Score.h"
#include "ShadowManager.h"
#include "Viewport.h"
#include "WWCamera.h"
#include "WWLoadGui.h"

#ifdef _DEBUG
#define EDIT_CAM
#endif

//#define SHOW_INFO

namespace Amju
{
const char* GSMain::NAME = "main";
static bool s_showAABBs = false;

static void OnPause(GuiElement*)
{
  TheGame::Instance()->SetCurrentState(TheGSPaused::Instance());
}

GSMain::GSMain()
{
  m_gui = WWLoadGui("main-gui.txt", false);
  Assert(m_gui);
  m_exitState = NOT_EXITED;

  m_clearColour = Colour(0.5f, 0.5f, 1, 1);
}

void GSMain::OnDeactive()
{
#if defined(MACOSX) || defined(WIN32)
  // Save score, level, etc.
  // (iOS calls this when app delegate gets messages)
  TheGameConfigFile::Instance()->Save();
#endif

  // Now we DON'T want to go to the Pause state if we are interrupted,
  //  as we are in a GUI state anyway.
  TheGame::Instance()->RegisterPauseState(nullptr);

  GameState::OnDeactive();
  TheLurker::Instance()->SetAsListener(false);
  TheEventPoller::Instance()->RemoveListener(m_gui);
  
  NetSendPlaySession(); // e.g. if pause button tapped, OK if already called elsewhere
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

  // When we are in the play state, we DO want to go to the paused state
  //  if we are interrupted (e.g. answer phone)
  TheGame::Instance()->RegisterPauseState(TheGSPaused::Instance());
  
  NetSendMarkSessionStart();
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

/*
  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
    (ke.key == 'd' || ke.key == 'D'))
  {
    TheResourceManager::Instance()->Dump();
    return true;
  }
*/

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

#ifdef _DEBUG
  if (ke.keyDown && ke.keyType == AMJU_KEY_CHAR && 
      (ke.key == 's' || ke.key == 'S'))
  {
    // S = toggle scrolling
    static float ss = GetScrollSpeed(); 
    if (GetScrollSpeed() < 1)
    {
      std::cout << "Setting scroll speed to " << ss << "\n";
      SetScrollSpeed(ss);
    }
    else 
    {
      std::cout << "Setting scroll speed to zero.\n";
      ss = GetScrollSpeed();
      SetScrollSpeed(0);
    }
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

void DeleteDeadObjects()
{
  static Game* game = TheGame::Instance();

  GameObjects* objs = game->GetGameObjects(); // map
  for (auto it = objs->begin(); it != objs->end(); )
  {
    PGameObject obj = it->second;

    ++it;

    WWGameObject* ww = dynamic_cast<WWGameObject*>(obj.GetPtr());
    if (ww && ww->IsDead())
    {
#ifdef DEBUG_DELETE_DEAD
      std::cout << "Deleting object " << Describe(ww) << "\n";
#endif
      ww->RemoveFromGame();
    }
  }
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

      Player* player = Player::GetPlayer(AMJU_P1);
      float y = -(player->GetPos().y);
      DepthUpdate(y);
      TheProcGen::Instance()->AddLayerWhenReady(player->GetPos().x);

      ThePowerUpManager::Instance()->Update();  

      game->UpdateGameObjects();

      DeleteDeadObjects();

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
  
  // Store scaled modelview matrix
  float mat[16];
  AmjuGL::GetMatrix(AmjuGL::AMJU_MODELVIEW_MATRIX, mat);

  // Split screen -- draw all screens
  int numVps = TheViewportManager::Instance()->GetNumViewports();
  for (int i = 0; i < numVps; i++)
  {
    AmjuGL::SetMatrixMode(AmjuGL::AMJU_MODELVIEW_MATRIX);
    AmjuGL::SetIdentity();
    // Restore scaled mv matrix
    AmjuGL::MultMatrix(mat);

    TheViewportManager::Instance()->GetViewport(i)->Draw2d();
  }
  m_gui->Draw(); // split screen line etc

  TheLurker::Instance()->Draw();

#ifdef GEKKO
  TheCursorManager::Instance()->Draw();
#endif

#ifdef SHOW_INFO
  // TODO Switch on/off
  if (true)
  {
    static GuiText t;
    t.SetFgCol(Colour(1, 1, 1, 1));
    t.SetBgCol(Colour(0, 0, 0, 1));
    t.SetDrawBg(true);
    t.SetFontSize(0.8f); // TODO CONFIG
    t.SetIsMulti(true);
    t.SetLocalPos(Vec2f(-1.0f, -0.8f));
    t.SetSize(Vec2f(1.0f, 0.2f));
    t.SetJust(GuiText::AMJU_JUST_LEFT);

    float playerX = Player::GetPlayer(AMJU_P1)->GetPos().x;

    static std::string old;
    std::string s = "Depth: " + ToString((int)GetCurrentDepth()) +
      " X: " + ToString((int)playerX) + 
      "\nNum Game Objects: " + 
      ToString((int)TheGame::Instance()->GetGameObjects()->size());

    if (old != s)
    {
      t.SetText(s);
    }
    old = s;
    t.Draw();
  }
#endif // SHOW_INFO
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
