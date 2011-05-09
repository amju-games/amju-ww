#ifdef MACOSX
#include <AmjuFirst.h>
#include <iostream>

#include <AmjuGL-OpenGL.h>

#include <Game.h>
#include "StartUp.h"
#include <SoundManager.h>
#include <AmjuGLWindowInfo.h>
#include <EventPollerImplGeneric.h>

#ifdef AMJU_USE_GLUT
#include <GLUT/glut.h>
#endif

#include <AmjuFinal.h>

using namespace Amju;

namespace Amju
{
// TODO Make this a GLUT version in AmjuGLOpenGL
bool AmjuGLOpenGL::CreateWindow(AmjuGLWindowInfo*)
{
  return true;
}
}

#ifdef AMJU_USE_GLUT
void draw()
{
  TheGame::Instance()->RunOneLoop();

  glutSwapBuffers(); // ?
  glutPostRedisplay();
}
#endif

int main(int argc, char **argv)
{
#ifdef AMJU_USE_GLUT
  // TODO Have a CreateWindow for GLUT.. but events are tangled up with creating windows :-(
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_DOUBLE | GLUT_DEPTH);
  glutCreateWindow("Hello");
  glutDisplayFunc(draw);
#endif

  TheEventPoller::Instance()->SetImpl(new EventPollerImplGeneric); 

  AmjuGL::SetImpl(new AmjuGLOpenGL);

  Amju::AmjuGLWindowInfo w(640, 480, false);
  Amju::AmjuGL::CreateWindow(&w);
  Amju::AmjuGL::Init();

  TheSoundManager::Instance()->SetImpl(new SoundPlayerImpl); // TODO

  StartUp();

#ifdef AMJU_USE_GLUT
  // Can't do this, glutMainLoop is in charge
  //TheGame::Instance()->Run();

  glutMainLoop();
#endif

  return 0;
}
 
#endif // MACOSX
