#ifndef AMJU_MAIN_H_INCLUDED
#define AMJU_MAIN_H_INCLUDED

#ifdef WIN32

// Include this in your main.cpp file.
// AmjuMain contains the WinMain function etc, which calls your main()
#ifdef main
#undef main
#endif

#define main AmjuMain

#endif // WIN32

#endif

