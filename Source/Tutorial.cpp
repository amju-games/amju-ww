/*
Amju Games source code (c) Copyright Jason Colman 2000-2006
*/

#include "AmjuFirst.h"
#include "Tutorial.h"
#include <StringUtils.h>
#include <Timer.h>
#include <Font.h>
#include <ResourceManager.h>
#include <EventPoller.h>
#include "AmjuFinal.h"

namespace Amju
{
void ReportError(const std::string&);

static const char LINE_SPLIT = '$';
static const char PAGE_SPLIT = '&';
static const char TIMED_PAGE = '*';

static const float FONT_SIZE = 1.2f;
static const float TIME_PER_CHAR = 0.02f;
static const float BORDER = 0.1f;
static const float MAX_PAGE_TIME = 5.0f; // time out 
static const float GROW_TIME = 0.3f;


Font* GetFont()
{
  static Font* font = 
    (Font*)TheResourceManager::Instance()->GetRes("font2d/arial-font.font");
  return font;
}

//void OnCloseTutorial()
//{
//  AMJU_CALL_STACK;
//
//  // Hide the current tutorial text
//  TheTutorial::Instance()->NextPageOrClose();
//}

Tutorial::Tutorial() : m_show(false)
{
  AMJU_CALL_STACK;

  m_time = 0;

  m_bgColour = Colour(1.0f, 1.0f, 1.0f, 0.8f);
  m_numCharsThisPage = 0;
 
  m_isLocked = false;

  TheEventPoller::Instance()->AddListener(this);

  Clear();
}

Vec2f Tutorial::GetSize() const
{
  return m_bg.GetSize();
}

Vec2f Tutorial::GetCentre() const
{
  return m_bg.GetLocalPos() + Vec2f(m_bg.GetSize().x, -m_bg.GetSize().y) * 0.5f;
}

void Tutorial::Lock()
{
  AMJU_CALL_STACK;

  m_isLocked = true;
}

void Tutorial::Unlock()
{
  AMJU_CALL_STACK;

  m_isLocked = false;
}

bool Tutorial::IsActive() const
{
  AMJU_CALL_STACK;

  return m_show;
}

// Key pressed to close Tutorial window.
bool Tutorial::Close()
{
  AMJU_CALL_STACK;

  if (!m_show)
  {
    return false; // not open - can't be closed
  }

  return true;
}

void Tutorial::NextPageOrClose() 
{
  AMJU_CALL_STACK;

#ifdef TUT_DEBUG
std::cout << "TUTORIAL: Next/close\n";
#endif

  if (m_numCharsThisPage < 10)
  {
    return; 
  }

  // Count number of chars in page
  int allChars = 0;
  const Page& page = m_pages[m_currentPage];
  int numLines = page.size();
  for (int i = 0; i < numLines; i++)
  {
    allChars += page[i].size();
  }

  // Draw all characters if we have not yet
  if (m_numCharsThisPage < allChars)
  {
    m_numCharsThisPage = allChars;
    return;
  }

  if (m_currentPage < ((int)m_pages.size() - 1))
  {
#ifdef TUT_DEBUG
std::cout << "..there is another page.\n";
#endif

    // There is another page
    ++m_currentPage;
    m_time = 0;
    m_numCharsThisPage = 0;
    // TODO Sound FX

    // Check if this page is timed
    CheckForTimedPage();
    return;
  }

#ifdef TUT_DEBUG
std::cout << "..there are no more pages.\n";
#endif

  // No more pages - trash this text.
  m_pages.clear();
  // Maybe there is some more text waiting
  if (m_storedText.empty())
  {
    m_show = false;
    m_time = 0;
    // Sound FX
  }
  else
  {
#ifdef TUT_DEBUG
std::cout << "..wait, there is more text Queued!\n";
#endif

    std::string s = *(m_storedText.begin());
    m_storedText.pop_front();
    SetText(s);
  }
}

void Tutorial::Update()
{
  AMJU_CALL_STACK;

  m_time += TheTimer::Instance()->GetDt();
  if (m_show)
  {
    // Reveal next character
    if (m_time > (float)(m_numCharsThisPage + 1) * TIME_PER_CHAR)
    {
      ++m_numCharsThisPage;
    }

    if (m_isTimed && m_time > m_maxPageTime)
    {
#ifdef TUT_DEBUG
std::cout << "TUTORIAL: page has just timed out!\n";
#endif

      NextPageOrClose();
    }
  }
}

void Tutorial::CheckForTimedPage()
{
  AMJU_CALL_STACK;

  m_maxPageTime = MAX_PAGE_TIME; // TODO

#ifdef ALL_PAGES_TIMED
  // ALL pages are timed
  m_isTimed = true;

#else

  m_isTimed = false;
  // Time out current text:
  // If last character on last line of current page is TIMED_PAGE, 
  //  then the page times out.
  // TODO Set time after '*' ??
  if (!m_pages.empty())
  {
    Page& page = m_pages[m_currentPage];
    Assert(!page.empty());
    std::string& line = page[page.size() - 1];
    if (line[line.size() - 1] == TIMED_PAGE)
    {
#ifdef TUT_DEBUG
std::cout << "TUTORIAL: This page is Timed, because last line is \"" << line.c_str() << "\"\n";
#endif
      m_isTimed = true;
      // Remove '*'
      line = line.substr(0, line.size() - 1);
    }
  }
#endif
}

bool Tutorial::OnMouseButtonEvent(const MouseButtonEvent& mbe)
{
  return MouseButton(mbe.isDown);
}

bool Tutorial::OnButtonEvent(const ButtonEvent& be)
{
  if (!m_show)
  {
    return false;
  }

  if (be.button == AMJU_BUTTON_A && be.isDown)
  {
    NextPageOrClose();
    return true;
  }

  return false;
}

bool Tutorial::MouseButton(bool down)
{
  AMJU_CALL_STACK;

  if (!m_show)
  {
    return false;
  }
/*
  if (m_pCloseButton->IsMouseOver())
  {
    m_pCloseButton->MouseButton(down, false, false);
    return;
  }
*/
  // If the Tutorial is active, clicking ANYWHERE on screen is like clicking
  // the OK button. 
  if (!down)
  {
    NextPageOrClose();
    //OnCloseTutorial();
    return true;
  }
  return false;
}

bool Tutorial::IsMouseOver() const
{
  AMJU_CALL_STACK;

  if (!m_show)
  {
    return false;
  }
  // This stops mouse action from working whenever the tutorial is active.
  return true;
}

bool Tutorial::Load()
{
  AMJU_CALL_STACK;

  // Load BG box
  if (!m_bg.OpenAndLoad("tutorial-gui.txt")) 
  {
    ReportError("Failed to load tutorial box");
    return false;
  }
  return true;
}

void Tutorial::DrawBg(float f)
{
  AMJU_CALL_STACK;

  float X = GetCentre().x;
  float Y = GetCentre().y;
  float W2 = GetSize().x * 0.5f;
  float H2 = GetSize().y * 0.5f;

  float top = Y + H2 * f;
  float bottom = Y - H2 * f;
  float left = X - W2 * f;
  float right = X + W2 * f;

  Vec2f pos = m_bg.GetLocalPos();
  Vec2f size = m_bg.GetSize();

  m_bg.SetLocalPos(Vec2f(left, top));
  m_bg.SetSize(Vec2f(right - left, top - bottom));

  PushColour();
  MultColour(m_bgColour);
  m_bg.Draw(); 
  PopColour();

  m_bg.SetSize(size);
  m_bg.SetLocalPos(pos);
}

void Tutorial::Draw()
{
  AMJU_CALL_STACK;

  static Font* pFont = GetFont(); 
  float size = pFont->GetSize();
  pFont->SetSize(FONT_SIZE);

  if (m_show)
  {
    // TODO If m_time is less than some limit, draw a box which gets larger.
    // Only show the text when the box is big enough
    if (m_time < GROW_TIME)
    {
      DrawBg(m_time / GROW_TIME);
    }
    else
    {
      DrawBg(1.0f);

#ifdef TUT_DEBUG
std::cout << "Tut: m_currentPage: " << m_currentPage
  << " m_pages.size: " << m_pages.size()
  << " m_show: " << m_show
  << " m_time: " << m_time
  << "\n";
#endif

      // Draw the lines of text in the current page
      Assert((unsigned int)m_currentPage < m_pages.size());
      Page& page = m_pages[m_currentPage];

      int numLines = page.size();
      int numChars = 0;
      for (int i = 0; i < numLines; i++)
      {
        std::string line = page[i];

        // Show the page of text one character at a time
        if (m_numCharsThisPage <= numChars)
        {
          break; // don't show this line or subsequent lines
        }
        int prevLines = numChars;
        numChars += line.size();
        if (m_numCharsThisPage < numChars)
        {
          Assert(m_numCharsThisPage >= prevLines);
          line = line.substr(0, (m_numCharsThisPage - prevLines));
        }

        float MID_Y = GetCentre().y; 
        float LINE_SPACING = 0.15f * FONT_SIZE;
        float Y_ADJUST = 0;

        const float x = m_bg.GetLocalPos().x + BORDER;
        const float y = MID_Y + Y_ADJUST + 0.5f * LINE_SPACING * (float)numLines - LINE_SPACING * (float)(i + 1);

        pFont->Print(x, y, line.c_str()); 
      }
      // TODO Show close button only if not timed
      //m_pCloseButton->Draw();
    }
  }
  else
  {
    // Make the text box smaller until it disappears.
    if (m_time < GROW_TIME)
    {
      DrawBg(1.0f - m_time / GROW_TIME);
    }
  }

  pFont->SetSize(size);
}

void Tutorial::Clear()
{
  AMJU_CALL_STACK;

  if (m_isLocked)
  {
    return;
  }

  m_pages.clear();
  m_storedText.clear();
  m_currentPage = 0;
  m_show = false;
  m_time = 10.0f; // so we don't see the box close at start up
  m_numCharsThisPage = 0;
}

void Tutorial::SetText(const std::string& s)
{
  AMJU_CALL_STACK;

  if (m_isLocked)
  {
    return;
  }

  if (!m_pages.empty())
  {
    // We are already displaying some text. Save this for later.
    m_storedText.push_back(s);
    return;
  }

  static Font* pFont = GetFont(); 
  float size = pFont->GetSize();
  pFont->SetSize(FONT_SIZE);

  // Text is split into Pages with PAGE_SPLIT char
  std::vector<std::string> pageLines = Split(s, PAGE_SPLIT);

  // Split each page into lines.
  // Text can be split into lines with LINE_SPLIT
  for (unsigned int i = 0; i < pageLines.size(); i++)
  {
    // Check each line in page, make sure it is not too long. If it is,
    // we make an extra line for the overflow.
    std::string line = pageLines[i]; // not split yet
    Page pageNotWrapped = Split(line, LINE_SPLIT);
    Page page; // page after word wrapping
    for (unsigned int j = 0 ; j < pageNotWrapped.size(); j++)
    {
      float MAX_WIDTH = GetSize().x - 2.0f * BORDER;
      // Split up line so no text falls outside
      // of the background box.
      Page wrappedLines = WrapFontText(pFont, pageNotWrapped[j].c_str(), MAX_WIDTH);
      for (unsigned int k = 0; k < wrappedLines.size(); k++)
      {
        page.push_back(wrappedLines[k]);
#ifdef TUT_DEBUG
std::cout << "Tut SetText: line: '" << wrappedLines[k] << "'\n";
#endif
      }
    }
    m_pages.push_back(page);
  }
  m_currentPage = 0;
  m_show = true;
  m_time = 0;
  m_numCharsThisPage = 0;
 
  CheckForTimedPage();
  pFont->SetSize(size);
}
}
