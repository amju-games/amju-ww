//#include "AmjuMain.h"
#include <string>
#include "ReportError.h"
#include "Screen.h"

#ifdef WIN32
// Windows - WinMain function
// Use SDL for now
#include <SDL.h>

using namespace Amju;
int AmjuMain(int argc, char **argv);

int main(int argc, char **argv)
{
  const SDL_VideoInfo* video;
 
  if ( SDL_Init(SDL_INIT_EVERYTHING) < 0 ) 
  {
    std::string err = std::string("Couldn't initialize SDL: ") + SDL_GetError();
    ReportError(err);
    exit(1);
  }
         
  /* Quit SDL properly on exit */
  atexit(SDL_Quit);
 
  /* Get the current video information */
  video = SDL_GetVideoInfo();
  if (!video) 
  {
    std::string err = std::string("Couldn't get video information: ") + SDL_GetError();
    ReportError(err);
    exit(1);
  }

  static const int WIDTH = 640;
  static const int HEIGHT = 480; 
  Screen::SetSize(WIDTH, HEIGHT);

  //SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);  // not needed ?
  //SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 1); ???

  // TODO fullscreen option
  if (SDL_SetVideoMode(WIDTH, HEIGHT, 
    0,   // ignored..? 0 same as video->vfmt->BitsPerPixel ?
    SDL_OPENGL) == 0) 
  {
    std::string err = std::string("Couldn't set video mode: ") + SDL_GetError();
    ReportError(err);
    exit(1);
  }

  AmjuMain(argc, argv);
  return 0;
}

#endif
