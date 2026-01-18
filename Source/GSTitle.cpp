#include <GuiButton.h>
#include <LoadScene.h>
#include "EventPoller.h"
#include "Game.h"
#include "GSChooseLevel.h"
#include "GSMenu.h"
#include "GSNewOrContinue.h"
#include "GSTitle.h"
#include "GSTweet.h"
#include "iOSKeyboard.h"
#include "iOSTweet.h"
#include "LevelManager.h"
#include "MySceneGraph.h"
#include "ResourceManager.h"
#include "SaveDir.h"
#include "Screenshot.h"
#include "SoundManager.h"
#include "SceneMesh.h"
#include "StartGame.h"
#include "WWLoadGui.h"

//#define FOR_SCREENSHOT

namespace Amju
{
const char* GSTitle::NAME = "title";

GSTitle::GSTitle()
{
}

class CommandStart : public GuiCommand
{
  virtual bool Do()
  {
#ifdef NO_MAIN_MENU
    // No main menu - just straight into the game..?
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_MAIN_GAME_MODE); 
#else
    // If menu state, do this INSTEAD of the above
    TheGSTitle::Instance()->GoToNewState(TheGSNewOrContinue::Instance());
#endif

    return false; //no undo
  }
};

class CommandQuit : public GuiCommand
{
  virtual bool Do()
  {
    // TODO Confirm ??
    exit(0); // This should exit cleanly - TODO verify this
    //TODO TheGame::Instance()->Quit();
    return false; //no undo
  }
};

void GSTitle::Update()
{
  GSText::Update();
  if (m_timer > 3000.0f) // TODO 
  {
    // Go to attract mode
    TheLevelManager::Instance()->SetLevelId(1);
    StartGame(1, AMJU_ATTRACT_MODE); // TODO two player etc
  }
}

void GSTitle::OnActive()
{
  GSText::OnActive();

  // TODO Add timestamp to filename to make it unique
  SaveScreenshot(GetSaveDir() + "/screenshot.png");
 
#if defined(AMJU_IOS) && defined(YES_TEST_TWITTER) 
  // Twitter test
  TwitterInit();
  while (!TwitterIsOk())
  {
    // Just for testing
    usleep(100000);
    std::cout << ".";
    
    // TODO Not implemented on all platforms
    // Amju::SleepMs(100);
  }
  std::cout << "\nTwitter is OK\n";
  std::vector<std::string> accountNames;
  TwitterGetAccounts(&accountNames);
  
  if (TwitterPostMessage(2, "Wow, I'm a post"))
  {
    std::cout << "Posted OK\n";
  }
  else
  {
    std::cout << "Post failed\n";
  }
  
  // TODO
  // bool TwitterPostMessageWithImage(int account, const std::string& message, const std::string* imagePathAndFilename);

  //ShareTwitterImage(); // TODO TEMP TEST
#endif  


////  ShowKeyboard(true); // TODO TEMP TEST
  
 
  // Start theme music
#ifdef GEKKO
  TheSoundManager::Instance()->PlaySong("sound/ww1.mod");
#else
  TheSoundManager::Instance()->PlaySong("sound/ww1.it");
#endif

  m_gui = WWLoadGui("title-gui.txt");
  Assert(m_gui);

  GuiButton* start = (GuiButton*)GetElementByName(m_gui, "start-button");
  start->SetCommand(new CommandStart);
  start->SetIsFocusButton(true);
  start->SetShowIfFocus(true);

  GetElementByName(m_gui, "tweet-button")->SetCommand(OnTweet);

#ifdef FOR_SCREENSHOT
  start->SetVisible(false);
#endif

  GuiElement* quit = m_gui->GetElementByName("quit-button");
  if (quit)
  {
    quit->SetCommand(new CommandQuit);
  }

#ifdef FOR_SCREENSHOT
  CreateText("\nrainbow\n   drop"); // TODO Localise
#else
  CreateText("\nrain\n bow\n drop"); // TODO Localise
#endif

  PSceneNode node = LoadScene("logo2.obj");
  Assert(node);
  node->SetIsLit(true);
  Matrix m;
  m.Scale(0.5f, 0.5f, 0.5f);
  m.TranslateKeepRotation(Vec3f(0, 0, -4)); // TODO TEMP TEST
  node->SetLocalTransform(m);
  SceneNode* root = GetTextSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(node);  
}
}
