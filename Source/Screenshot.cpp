#include <iostream>
#include <AmjuGL.h>
#include <SavePng.h>
#include <Screen.h>
#include "Screenshot.h"

namespace Amju
{
unsigned char* SaveScreenshotToArrayOnHeap(const Vec2f& picCentre, const Vec2f& picSize)
{
  static const int BYTES_PER_PIXEL = 3;
  
  int w = picSize.x;
  int h = picSize.y;
  
  // Make sure centre is at least w/2 or h/2 away from edges
  int x = picCentre.x;
  x = std::max(x, w / 2);
  x = std::min(x, Screen::X() - w / 2);
  int y = picCentre.y;
  y = std::max(y, h / 2);
  y = std::min(y, Screen::Y() - h / 2);
  
  unsigned char* mem = new unsigned char[BYTES_PER_PIXEL * w * h];
  AmjuGL::GetScreenshot(mem, x - w/2, y + h/2, w, h);
  
  return mem;
}
  
bool SaveScreenshot(const std::string& filename, const Vec2f& picCentre, const Vec2f& picSize)
{
  static const int BYTES_PER_PIXEL = 3;

  int w = picSize.x;
  int h = picSize.y;

  // Make sure centre is at least w/2 or h/2 away from edges
  int x = picCentre.x;
  x = std::max(x, w / 2);
  x = std::min(x, Screen::X() - w / 2);
  int y = picCentre.y;
  y = std::max(y, h / 2);
  y = std::min(y, Screen::Y() - h / 2);
  
  unsigned char* mem = new unsigned char[BYTES_PER_PIXEL * w * h];
  AmjuGL::GetScreenshot(mem, x, y, w, h);

  // Save as .png
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

