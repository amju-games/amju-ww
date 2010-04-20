#include <AmjuFirst.h>
#include <iostream>

#ifdef GEKKO
#include "AmjuGL-GCube.h"
#include "EventPollerImplWii.h"
#include "SoundWii.h"
#endif // GEKKO

#ifdef WIN32
// Assume we always use OpenGL for now
#include <AmjuGL-OpenGL.h>
#include <EventPollerImplSDL.h>
//#include <AmjuGL-OpenGLES.h> // TODO TEMP TEST
#include <AmjuGL-DX9.h>
#include <EventPollerImplWin32.h>
#include <SoundSDLMixer.h>
#endif // WIN32

#include <Game.h>
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
#include <AmjuFinal.h>

using namespace Amju;

// Windows: use OpenGL or Direct 3D 
#define USE_OPENGL_NOT_D3D

int main(int argc, char **argv)
{
#ifdef GEKKO
	AmjuGL::SetImpl(new AmjuGLGCube(false /* console */));
  TheEventPoller::Instance()->SetImpl(new EventPollerImplWii);
  TheSoundManager::Instance()->SetImpl(new SoundWii);
  // TODO Any way we can get the directory where the executable lives ?
  File::SetRoot("/apps/amju_ww/data/", "/");
#endif // GEKKO

#ifdef WIN32
//	AmjuGL::SetImpl(new AmjuGLOpenGLES);
  #ifdef USE_OPENGL_NOT_D3D
	AmjuGL::SetImpl(new AmjuGLOpenGL);
  TheEventPoller::Instance()->SetImpl(new EventPollerImplSDL);
#else
  // Must use Win32 event poller with D3D
  AmjuGL::SetImpl(new AmjuGLDX9((WNDPROC)&EventPollerImplWin32::WndProc));
  TheEventPoller::Instance()->SetImpl(new EventPollerImplWin32);
#endif

  TheSoundManager::Instance()->SetImpl(new SoundSDLMixer);
#endif // WIN32


  // Initialise window etc
  Amju::AmjuGLWindowInfo w(640, 480, false);
  Amju::AmjuGL::CreateWindow(&w);
  Amju::AmjuGL::Init();
	
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

  TheGame::Instance()->SetCurrentState(GSLogo::NAME); 
//  TheGame::Instance()->SetCurrentState(TestState::NAME);

  TheGame::Instance()->Run();

	return 0;
}
 
 
