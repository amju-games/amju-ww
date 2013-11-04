#include <AmjuFirst.h>
#include "StartUp.h"
#include <Game.h>
#include <BruteForce.h>
#include <ResourceManager.h>
#include "GSLogo.h"
#include "GSLoadLevel.h" // TEMP; so we start immediately in game
#include "CursorManager.h"
#include "Hud.h"
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
#include "LevelManager.h"
#include "StartGame.h"
#include <Directory.h>
#include <BassSoundPlayer.h>
#include <AmjuFinal.h>

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

namespace Amju
{
void StartUpBeforeCreateWindow()
{
#if defined(AMJU_IOS)
  std::string dataDir = GetDataDir();
  std::cout << "Data Dir: " << dataDir << "\n";
  File::SetRoot(dataDir, "/");
#endif
  
  if (FileImplGlue::OpenGlueFile(GLUE_FILE))
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

  AmjuGL::SetClearColour(Colour(0, 0, 0, 1.0f));

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
	
  // Add SceneNode types to factory
  TheSceneNodeFactory::Instance()->Add(SceneNode::NAME, &SceneNode::Create);
  TheSceneNodeFactory::Instance()->Add(SceneMesh::NAME, &SceneMesh::Create);
	
  TheCursorManager::Instance()->Load(Vec2f(0.025f, -0.08f)); // hotspot position
	
  rm->LoadResourceGroup("2dtext-group"); // TODO not using groups
  TheHud::Instance()->Load();

  // Set collision system
  CollisionDetector* cd = new BruteForce;
  // Default intersection test is OK
  TheCollisionManager::Instance()->SetCollisionDetector(cd);

#ifdef BYPASS_TITLE
  // TODO Only needed if we bypass title
  TheResourceManager::Instance()->LoadResourceGroup("3dtext-group");
  TheResourceManager::Instance()->LoadResourceGroup("gui-group");
  TheLevelManager::Instance()->SetLevelId(1);
  StartGame(1, AMJU_MAIN_GAME_MODE); // TODO two player etc
  TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME); 
#else
  TheGame::Instance()->SetCurrentState(TheGSLogo::Instance());	
#endif
}
}

