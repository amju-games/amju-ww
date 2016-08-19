#pragma once

#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
// Button command - goes to this state
void OnTweet(GuiElement*);

class GSTweet : public GSText
{
  GSTweet();
  friend class Singleton<GSTweet>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();
  virtual void OnDeactive();

  static void SetDefaultText(const std::string& text);

  void UpdateCharCount();
  
  void OnSendTweet();
};
typedef Singleton<GSTweet> TheGSTweet;
} // namespace

