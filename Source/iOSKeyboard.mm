#ifdef AMJU_IOS

#include <EventPoller.h>
#include <EventTypes.h>
#include "iOSKeyboard.h"

// http://stackoverflow.com/questions/7253477/how-to-display-the-iphone-ipad-keyboard-over-a-full-screen-opengl-es-app

static void QueueEvent(Amju::Event* e)
{
  Amju::TheEventPoller::Instance()->GetImpl()->QueueEvent(e);
}

@interface MyKeyboardView : UIView <UIKeyInput>
@end

@implementation MyKeyboardView

- (void) insertText:(NSString *)text
{
  // Do something with the typed character
  
  Amju::KeyEvent ke;
  // Printable char
  ke.keyType = Amju::AMJU_KEY_CHAR;
  ke.key = [text characterAtIndex:0]; //CHARS[i];
  
  // TODO Space is special case
  
  ke.modifier = Amju::AMJU_KEY_MOD_NONE;
  ke.keyDown = true;
  QueueEvent(new Amju::KeyEvent(ke)); // must be on heap
  ke.keyDown = false;
  QueueEvent(new Amju::KeyEvent(ke));
}

- (void) deleteBackward
{
  // Handle the delete key
  Amju::KeyEvent ke;
  ke.keyType = Amju::AMJU_KEY_BACKSPACE;
  ke.keyDown = true;
  QueueEvent(new Amju::KeyEvent(ke));
  ke.keyDown = false;
  QueueEvent(new Amju::KeyEvent(ke));
}

- (BOOL) hasText
{
  // Return whether there's any text present
  return YES;
}

- (BOOL) canBecomeFirstResponder
{
  return YES;
}
@end

namespace Amju
{
static MyKeyboardView* myView = nullptr;

void* InitKeyboard()
{
  myView = [MyKeyboardView new];
  // Calling code adds this view as a subview.
  return myView;
} 

void ShowKeyboard(bool showNotHide)
{
  if (showNotHide)
  {
    [myView becomeFirstResponder];
  }
  else
  {
    [myView resignFirstResponder];
  }
}
} // namespace

#endif // AMJU_IOS

