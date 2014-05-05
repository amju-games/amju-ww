#if !defined(IPHONE) //&& !defined(ANDROID_NDK)

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
#ifdef GEKKO
AmjuGLWindowInfo w(640, 480, false, "Amju Rainbow Drop");
#else
AmjuGLWindowInfo w(480, 640, false, "Amju Rainbow Drop");
#endif
}

#include "StartUp.h"

#if !defined(IPHONE) && !defined(ANDROID_NDK)
#include <main.h>
#endif

#endif // not IPHONE
