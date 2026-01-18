#if !defined(IPHONE) && !defined(ANDROID_NDK)

#ifdef MACOSX
#define AMJU_USE_OPENGL
#define AMJU_USE_GLUT
#endif

#ifdef WIN32
#define AMJU_USE_OPENGL
#define AMJU_USE_GLUT
#endif

// Create global variable window info 
#include <AmjuGLWindowInfo.h>

namespace Amju
{
AmjuGLWindowInfo w(480, 640, false, "Amju Wibble Wobble");
}

#include "StartUp.h"
#include <main.h>

#endif // not IPHONE
