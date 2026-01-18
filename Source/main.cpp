#ifndef IPHONE

#ifdef MACOSX
#define AMJU_USE_OPENGL
#define AMJU_USE_GLUT
#endif

// Create global variable window info 
#include <AmjuGLWindowInfo.h>

namespace Amju
{
AmjuGLWindowInfo w(640, 480, false, "Amju Wibble Wobble");
}

#include "StartUp.h"
#include <main.h>

#endif // not IPHONE
