#include <AmjuFirst.h>
#include "StartUp.h"
#include <Game.h>
#include <ResourceManager.h>
#include "GSLogo.h"
#include "GSLoadLevel.h" // TEMP; so we start immediately in game
#include "TestState.h" // TODO TEMP TEST
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
#include <AmjuFinal.h>

#ifdef WIN32
#define GLUE_FILE "data-win.glue"
#define MUSIC_GLUE_FILE "music-win.glue"
#endif

#ifdef GEKKO
#define GLUE_FILE "data-wii.glue"
#define MUSIC_GLUE_FILE "music-wii.glue"
#endif

#ifdef IPHONE
#define GLUE_FILE "data-iphone.glue"
#define MUSIC_GLUE_FILE "music-iphone.glue"
#endif

namespace Amju
{
void StartUp()
{
#ifndef NO_COMPILED_ASSETS
  // Use glue file -- or comment out to use individual files
  if (!FileImplGlue::OpenGlueFile(GLUE_FILE))
  {
    ReportError("Failed to open data glue file");
  }

#ifndef IPHONE // TODO
  // Set up music glue file
  GlueFile* pMusicGlueFile = new GlueFileMem;
  if (pMusicGlueFile->OpenGlueFile(MUSIC_GLUE_FILE, true /* read only */))
  {
    TheSoundManager::Instance()->SetGlueFile(pMusicGlueFile);
  }
  else
  {
    ReportError("Failed to open music glue file");
  }
#endif // ! IPHONE	
#endif // ! NO_COMPILED_ASSETS

  // TODO Other languages - preferences
  if (!Localise::LoadStringTable("english.txt"))
  {
    ReportError("No localise string table.");
  }

	// Add resource loaders
	TheResourceManager::Instance()->AddLoader("bmpa", BmpALoader);
	TheResourceManager::Instance()->AddLoader("obj", ObjLoader);
	TheResourceManager::Instance()->AddLoader("font", FontLoader);
	TheResourceManager::Instance()->AddLoader("mod", BinaryResourceLoader);
	TheResourceManager::Instance()->AddLoader("snd", BinaryResourceLoader);
	TheResourceManager::Instance()->AddLoader("wav", BinaryResourceLoader);
	
	// Add SceneNode types to factory
	TheSceneNodeFactory::Instance()->Add(SceneNode::NAME, &SceneNode::Create);
	TheSceneNodeFactory::Instance()->Add(SceneMesh::NAME, &SceneMesh::Create);
	
	TheCursorManager::Instance()->Load();
	
	TheResourceManager::Instance()->LoadResourceGroup("2dtext-group");
	TheHud::Instance()->Load();

  // iPhone: check if a game was interrupted. If so, go to 
  //  Continue/new game menu, else start with logo.
/* TODO
  if (TheGameSaver::Instance()->IsSavedGame())
  {
    TheGame::Instance()->SetCurrentState(GSMenu::NAME); 
  }
  else
  {
    TheGame::Instance()->SetCurrentState(GSLogo::NAME); 
  }
*/
#ifdef BYPASS_TITLE
  // TODO Only needed if we bypass title
  TheResourceManager::Instance()->LoadResourceGroup("3dtext-group");
  TheResourceManager::Instance()->LoadResourceGroup("gui-group");
  TheLevelManager::Instance()->SetLevelId(1);
  StartGame(1, AMJU_MAIN_GAME_MODE); // TODO two player etc
  TheGame::Instance()->SetCurrentState(GSLoadLevel::NAME); 
#else
	TheGame::Instance()->SetCurrentState(GSLogo::NAME);	
#endif
}
}

