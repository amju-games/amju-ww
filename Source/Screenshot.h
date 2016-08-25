#pragma once

#include <string>
#include <Vec2.h>

namespace Amju
{
// Save screenshot in memory, as an array allocated on the heap.
// When you are done, you must delete the array data:
//   delete [] theData;
unsigned char* SaveScreenshotToArrayOnHeap(const Vec2f& picCentre, const Vec2f& picSize);
  
// Save to .png file, is a bit slow.
bool SaveScreenshot(const std::string& filename, const Vec2f& picCentre, const Vec2f& picSize);
}

