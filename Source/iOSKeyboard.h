#pragma once

#ifdef AMJU_IOS

#include <GuiElement.h>

namespace Amju
{
class GuiTextEditIos : public GuiElement
{
public:
  GuiTextEditIos();
  ~GuiTextEditIos();
  
  static void SetViewController(void*);
  
  void ShowKeyboard(bool showNotHide);
  void SetText(const std::string& text);
  std::string GetText() const;
  
  virtual void Draw() override {}
  virtual bool Load(File*) override;
  
private:
};
}

#endif // AMJU_IOS


