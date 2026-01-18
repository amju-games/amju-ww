#ifdef AMJU_IOS

#include <EventPoller.h>
#include <EventTypes.h>
#include <GuiFactory.h>
#include <GuiTextEdit.h>
#include <Screen.h>
#include "iOSKeyboard.h"
#include "ViewController.h"

static const float BORDER_WIDTH = 6.f;
static const float CORNER_RADIUS = 10.f;

// http://stackoverflow.com/questions/7253477/how-to-display-the-iphone-ipad-keyboard-over-a-full-screen-opengl-es-app

@interface MyKeyboardView : UITextView <UIKeyInput>
@end

@implementation MyKeyboardView

// TODO Override behaviour ?
//- (void) insertText:(NSString *)text
//{
//  // Do something with the typed character
//}
//
//- (void) deleteBackward
//{
//}

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
static GuiElement* CreateTextEdit()
{
  return new GuiTextEditIos;
}

static  ViewController* vc = nullptr;
  
void GuiTextEditIos::SetViewController(void* vvc)
{
  vc = (ViewController*)vvc;
  
  // Replace regular type (GuiTextEdit) associated with name
  TheGuiFactory::Instance()->Add(GuiTextEdit::NAME, CreateTextEdit);
}
  
// TODO
// This is only OK so long as we only have one text edit box per screen...
static MyKeyboardView* myView = nullptr;
  
GuiTextEditIos::GuiTextEditIos()
{
  myView = [MyKeyboardView new];
  myView.hidden = YES;
  
  float fontSize = 14.0f; // TODO TEMP TEST - depends on screen size??
  
  // Set font
  myView.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:fontSize];
  
  // Rounded corners
  myView.layer.cornerRadius = CORNER_RADIUS;
  
  // Border colour
  myView.layer.borderColor = [UIColor blueColor].CGColor;
  myView.layer.borderWidth = BORDER_WIDTH;
  
  [vc.view addSubview:myView];
}

GuiTextEditIos::~GuiTextEditIos()
{
  myView = nullptr;
}
  
bool GuiTextEditIos::Load(File* f)
{
  if (!GuiElement::Load(f))
  {
    return false;
  }
  
  float scale = 1.f;
  if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
  {
    scale = [[UIScreen mainScreen] scale];
  }

  float scrX = Screen::X() / scale;
  float scrY = Screen::Y() / scale;

  float w = m_size.x * 0.5f * scrX;
  float h = m_size.y * 0.5f * scrY;
  
  Vec2f pos = GetCombinedPos();
  float x = (pos.x + 1.0f) * 0.5f * scrX;
  float y = (1.0f - (pos.y + 1.0f) * 0.5f) * scrY;

  // Account for border size -- border is drawn inside frame.
  w += 2 * BORDER_WIDTH;
  h += 2 * BORDER_WIDTH;
  x -= BORDER_WIDTH;
  y -= BORDER_WIDTH;
  
  [myView setFrame:CGRectMake(x, y, w, h)];

  // Padding between edge and text
  myView.textContainer.lineFragmentPadding = BORDER_WIDTH * 2;
  
  std::string text;
  if (!f->GetLocalisedString(&text))
  {
    f->ReportError("GUI Text: Expected localised string");
    return false;
  }
  SetText(text);
  
  std::string options;
  if (!f->GetDataLine(&options))
  {
    f->ReportError("GUI Text: Expected options string");
    return false;
  }
  // TODO use options string
  
  return true;
}

void GuiTextEditIos::SetText(const std::string& text)
{
  myView.text = [[NSString alloc] initWithUTF8String:text.c_str()];
}
    
std::string GuiTextEditIos::GetText() const
{
  return std::string([myView.text UTF8String]);
}
    
void GuiTextEditIos::ShowKeyboard(bool showNotHide)
{
  if (showNotHide)
  {
    myView.hidden = NO;
    [myView becomeFirstResponder];
  }
  else
  {
    myView.hidden = YES;
    [myView resignFirstResponder];
  }
}
} // namespace

#endif // AMJU_IOS

