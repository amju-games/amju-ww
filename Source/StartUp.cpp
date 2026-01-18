#include <AmjuFirst.h>
#include "StartUp.h"
#include <Game.h>
#include <ResourceManager.h>
#include "GSLogo.h"
#include "GSMain.h" // TEMP; so we start immediately in game
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
#include <AmjuFinal.h>

using namespace Amju;

void StartUp()
{
  //GlueF//ile* gf = new GlueFile;
  //gf->OpenGlueFile("test.glue");

  // Use glue file -- or comment out to use individual files
//  FileImplGlue::OpenGlueFile("test.glue");

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
    TheGame::Instance()->SetCurrentState(GSLogo::NAME); 
	//  TheGame::Instance()->SetCurrentState(TestState::NAME);	
}
