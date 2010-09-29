/*
Amju Games source code (c) Copyright Jason Colman 2000-2006
*/

#ifndef TUTORIAL_H_INCLUDED
#define TUTORIAL_H_INCLUDED

#include <deque>
#include <string>
#include <vector>
#include <Singleton.h>
#include <GuiImage.h>
#include <Colour.h>
#include <EventListener.h>

namespace Amju
{
class Tutorial : public EventListener, public NonCopyable
{
private:
  Tutorial();
  friend class Singleton<Tutorial>;

public:
  virtual void OnMouseButtonEvent(const MouseButtonEvent&);

//  void OnNewGame();

  void Draw();
  void Update();
  bool Load();

  // This resets the Show flag
  // Text is split into pages with '@'
  // Text can be split into lines with '$'
  // If the last character of a page is '*' the page times out, no need to
  //  click the close button.
  void SetText(const std::string& s);

  // Call if key pressed to close Tutorial window.
  // Returns true if window was closed.
  bool Close();

  // Clear all queued text: use this when a new game starts
  void Clear();

  void SetBgColour(const Colour& c);

  // Returns true if mouse is over the text box or OK button and the 
  // tutorial is active.
  bool IsMouseOver() const;

  // Return true if Tutorial is showing some text
  bool IsActive() const;

  // Prevent any new text from being queued
  void Lock();
  // Allow new text to be queued
  void Unlock();

private:
  // Draw background box at fraction of full size
  void DrawBg(float f);

  void CheckForTimedPage();

  Vec2f GetSize() const;
  Vec2f GetCentre() const;

  void NextPageOrClose(); 

  void MouseButton(bool down);

private:
  // One page is a vector of lines of text
  typedef std::vector<std::string> Page;

  // Whole text is a vector of pages
  typedef std::vector<Page> Pages;
  Pages m_pages;

  // Close current tutorial text button
  PGuiElement m_pCloseButton;

  bool m_show;

  // Time since this page shown 
  float m_time;
  // If true, this page times out
  bool m_isTimed;
  // Time this page shown, for timed pages
  float m_maxPageTime;

  // Number of characters to show in the current page. This is so the text
  // is gradually revealed, not printed all at once.
  int m_numCharsThisPage;

  // Background box for the text
  // TODO Round corners ??
  GuiImage m_bg;
  Colour m_bgColour;

  int m_currentPage;

  // SetText() may get called when we are already displaying some text.
  // In this case we store the text for later.
  std::deque<std::string> m_storedText;

  bool m_isLocked;
};

typedef Singleton<Tutorial> TheTutorial;

// Show the given message the first time this is called for the given number.
// Subsequent calls with the same number will not display a message.
// Flags are saved in the save file for the given player (PlayerInfo index).
bool FirstTimeTutorialMessage(
  const std::string& message, int messageNumber, int playerNum = 0);

}

#endif

