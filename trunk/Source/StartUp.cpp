#include <AmjuFirst.h>
#include <Game.h>
#include <AmjuGLWindowInfo.h>
#include <BruteForce.h>
#include <ResourceManager.h>
#include <File.h>
#include <AlphaBmpLoader.h>
#include <ObjMesh.h>
#include <Font.h>
#include <SoundManager.h>
#include <SceneGraph.h>
#include <SceneNode.h>
#include <SceneMesh.h>
#include <BinaryResource.h>
#include <FileImplGlue.h>
#include <GlueFileMem.h>
#include <Localise.h>
#include <ReportError.h>
#include <File.h>
#include <Screen.h>
#include <Directory.h>
#include <ConfigFile.h>
#include <ROConfig.h>
#include <BassSoundPlayer.h>
#include <GuiButton.h>
#include <EventPoller.h>
#include "StartUp.h"
#include "GSLogo.h"
#include "GSLoadLevel.h" // TEMP; so we start immediately in game
#include "GSCopyAssets.h"
#include "CursorManager.h"
#include "Hud.h"
#include "LevelManager.h"
#include "StartGame.h"
#include "GSPaused.h"
#include "SaveDir.h"
#include "ResizeHandler.h"
#include <AmjuFinal.h>

#define SHOW_FRAME_RATE

#ifdef MACOSX
#define GLUE_FILE "data-Mac.glue"
#define MUSIC_GLUE_FILE "music-Mac.glue"
#endif

#ifdef WIN32
#define GLUE_FILE "data-win.glue"
#define MUSIC_GLUE_FILE "music-win.glue"
#endif

#ifdef GEKKO
#define GLUE_FILE "data-wii.glue"
#define MUSIC_GLUE_FILE "music-wii.glue"
#endif

#ifdef IPHONE
#define GLUE_FILE "data-iOS.glue"
#define MUSIC_GLUE_FILE "music-iOS.glue"
#endif

#ifdef ANDROID_NDK
#define GLUE_FILE "data-android.glue"
#define MUSIC_GLUE_FILE "music-android.glue"
#endif

namespace Amju
{
extern Amju::AmjuGLWindowInfo w;

// Filename for the writable game config file, not the read-only config.
static std::string ConfigFilename()
{
  std::string filename = GetSaveDir() + "config.txt";

#ifdef _DEBUG
std::cout << "Config file: " << filename << "\n";
#endif

  return filename;
}

void StartUpBeforeCreateWindow()
{
#if defined(AMJU_IOS)
  std::string dataDir = GetDataDir();
  std::cout << "Data Dir: " << dataDir << "\n";
  File::SetRoot(dataDir, "/");
#endif

  SetROConfigFilename(GetSaveDir() + "roconfig.txt");

  GameConfigFile* gcf = TheGameConfigFile::Instance();
  std::string filename = ConfigFilename();
  gcf->SetFilePath(filename);
  if (FileExists(filename) && !gcf->Load())
  {
    std::cout << "Failed to load game config file: " << filename << "\n";
  }

#ifndef AMJU_IOS
  // Can't resize on iOS!
  const char* SCREEN_X = "screen-x"; // TODO Must match ResizeHandler - use GameConsts
  const char* SCREEN_Y = "screen-y";

  /*
  if (gcf->Exists(SCREEN_X) && gcf->Exists(SCREEN_Y))
  {
    w.SetWidth(gcf->GetInt(SCREEN_X));
    w.SetHeight(gcf->GetInt(SCREEN_Y));
  }
  */
#endif

  GlueFileMem* gfm = new GlueFileMem;  
  if (FileImplGlue::OpenGlueFile(GLUE_FILE, gfm))
  {
    std::cout << "Opened glue file " << GLUE_FILE << "\n";
  }
  else
  {
    ReportError("Failed to open data glue file");
  }
  
  // Set up music glue file
  SoundManager* sm = TheSoundManager::Instance();  
#if defined (MACOSX) || defined(WIN32) || defined(AMJU_IOS)
  sm->SetImpl(new BassSoundPlayer);
#endif

  GlueFile* pMusicGlueFile = new GlueFileMem;
  if (pMusicGlueFile->OpenGlueFile(MUSIC_GLUE_FILE, true /* read only */))
  {
    sm->SetGlueFile(pMusicGlueFile);
  }
  else
  {
    ReportError("Failed to open music glue file");
  }
}

void StartUpAfterCreateWindow()
{
  Game* game = TheGame::Instance();
  game->SetUpdateCopy(true); // if updating game objects can create/destroy objects

#ifdef GEKKO
  // TODO Better to put this in library main() if we can get the app's directory
  File::SetRoot("/apps/amju_ww/data/", "/");
#endif

  //AmjuGL::SetClearColour(Colour(0, 0, 0, 1.0f));

  // TODO Other languages - preferences
  if (!Localise::LoadStringTable("english.txt"))
  {
    ReportError("No localise string table.");
  }

  // Add resource loaders
  ResourceManager* rm = TheResourceManager::Instance();
  rm->AddLoader("bmpa", BmpALoader);
  rm->AddLoader("obj", BinaryObjLoader);
  //rm->AddLoader("obj", TextObjLoader);

  rm->AddLoader("font", FontLoader);
  rm->AddLoader("mod", BinaryResourceLoader);
  rm->AddLoader("snd", BinaryResourceLoader);
  rm->AddLoader("wav", BinaryResourceLoader);
	
  TheCursorManager::Instance()->Load(Vec2f(0.025f, -0.08f)); // hotspot position
	
  TheHud::Instance()->Load();

  // Set collision system
  CollisionDetector* cd = new BruteForce;
  // Default intersection test is OK
  TheCollisionManager::Instance()->SetCollisionDetector(cd);

  game->RegisterPauseState(TheGSPaused::Instance());

#ifndef AMJU_IOS
  TheEventPoller::Instance()->AddListener(new ResizeHandler);
#endif

  GuiButton::SetClickFilename("sound/navigate_40.wav");

#ifdef SHOW_FRAME_RATE
  Font* font = (Font*)rm->GetRes("font2d/arial-font.font");
  game->SetFrameTimeFont(font);
#endif

#ifdef BYPASS_TITLE
  // TODO Only needed if we bypass title
  TheLevelManager::Instance()->SetLevelId(1);
  StartGame(1, AMJU_MAIN_GAME_MODE); // TODO two player etc
  TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME); 
#else
  TheGame::Instance()->SetCurrentState(TheGSCopyAssets::Instance());	
#endif
}
}

