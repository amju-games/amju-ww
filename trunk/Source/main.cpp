#ifndef IPHONE

// Create global variable window info 
#include <AmjuGLWindowInfo.h>

#define AMJU_USE_DX9

namespace Amju
{
AmjuGLWindowInfo w(640, 480, false, "Amju Wibble Wobble");
}

#include "StartUp.h"
#include <main.h>

#endif // not IPHONE
