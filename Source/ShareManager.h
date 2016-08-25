#pragma once

#include <string>
#include <Singleton.h>
#include <Vec3.h>

namespace Amju
{
  class ShareManager : public NonCopyable
  {
    ShareManager() = default;
    friend Singleton<ShareManager>;
    
  public:
    // Set position on which to centre screenshot, which we will take later when TakeScreenshot
    //  is called.
    // TODO Countdown number of frames
    void SetTakeScreenshot(const Vec3f& pos3d);
    
    // Call from Draw() - take screenshot if set above
    void TakeScreenshot();
    
    // Share text set with SetShareText and screenshot taken when TakeScreenshot was last called.
    // If no screenshot, just shares text.
    void ShareTextAndScreenshot();
    
    void ClearScreenshotData();
    
    // Set the text which will be used when we next Share
    void SetShareText(const std::string& text);
    
  private:
    std::string m_text;
    Vec3f m_pos3d;
    
    bool m_yesTakeScreenshot = false;
    int m_x = 0;
    int m_y = 0;
    int m_w = 0;
    int m_h = 0;
    unsigned char* m_data = nullptr;
  };

  typedef Singleton<ShareManager> TheShareManager;
}

