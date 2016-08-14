#include <iostream>
#include <AmjuGL.h>
#include <SavePng.h>
#include "Screenshot.h"

namespace Amju
{
bool SaveScreenshot(const std::string& filename)
{
  static const int BYTES_PER_PIXEL = 3;
  // Fraction of screen width and height that the mugshot covers
  //static const int SCREEN_FRACTION = 20;
  int w = 64; // TODO Screen::X() / SCREEN_FRACTION;
  int h = 64; // TODO Screen::Y() / SCREEN_FRACTION;

  unsigned char* mem = new unsigned char[BYTES_PER_PIXEL * w * h];
  AmjuGL::GetScreenshot(mem, w, h);

  // Save as .png
//  std::string filename = "mugshot.png";
  bool savedPngOk = SavePng(w, h, mem, filename.c_str(), BYTES_PER_PIXEL);
  delete [] mem;

  if (savedPngOk)
  {
    std::cout << "Saved png OK! Filename: " << filename << "\n";

    // Upload to server
//    std::string url = TheVe1ReqManager::Instance()->MakeUrl(UPLOAD_MUGSHOT);
//    url += "&playerid=" + ToString(GetLocalPlayerId());
//    std::cout << "Upload to this url: " << url << "\n";

//    UploadScreenshot(filename, url);

//    AmjuGL::SetClearColour(Colour(0, 0, 0, 1));
//    GoBack();
    
    return true;
  }
  else
  {
    std::cout << "FAILED to save png! Filename: " << filename << "\n";
    return false;
  }
}

}

