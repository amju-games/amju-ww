#include <Screen.h>
#include <Unproject.h>
#include "GameConsts.h"
#ifdef AMJU_IOS
#include "iOSShare.h"
#endif
#include "Screenshot.h"
#include "ShareManager.h"

namespace Amju
{
  void ShareManager::ShareTextAndScreenshot()
  {
#ifdef AMJU_IOS
    iOSShareTextAndScreenshot(m_data, m_text, m_w, m_h);
#endif
  }

  void ShareManager::ClearScreenshotData()
  {
    delete [] m_data; // Was allocated on heap with new[]
    m_data = nullptr;
  }
  
  void ShareManager::SetTakeScreenshot(const Vec3f& pos3d)
  {
    m_pos3d = pos3d;
    m_yesTakeScreenshot = true; // TODO countdown number of frames
    m_x = 0; // calc when we take screenshot by projecting pos3d
    m_y = 0;
    m_w = SCREENSHOT_W;
    m_h = SCREENSHOT_H;
  }
  
  void ShareManager::TakeScreenshot()
  {
    if (m_yesTakeScreenshot)
    {
      // Delete old screenshot data
      delete [] m_data; // Was allocated on heap with new[]
      
      // Project 3d pos to get screen space centre of screenshot
      Vec2f pos2d;
      Project(m_pos3d, &pos2d);
      // Pos2d should be in -1..1 coord space
      m_x = (pos2d.x * 0.5f + 0.5f) * Screen::X();
      // TODO y-coord could be from top rather than bottom etc
      m_y = (pos2d.y * 0.5f + 0.5f) * Screen::Y();
      
      // Take the screenshot, data is allocated with new[]
      m_data = SaveScreenshotToArrayOnHeap(Vec2f(m_x, m_y), Vec2f(m_w, m_h));
      
      m_yesTakeScreenshot = false;
    }
  }
  
  void ShareManager::SetShareText(const std::string& text)
  {
    m_text = text;
  }
}

