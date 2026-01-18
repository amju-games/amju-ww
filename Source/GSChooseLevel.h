#pragma once

#include "GSText.h"

namespace Amju
{
class GSChooseLevel : public GSText, public NonCopyable
{
private:
  GSChooseLevel() {}
  friend class Singleton<GSChooseLevel>;

public:
  static const char* NAME;

  virtual void Draw() override;
  virtual void OnActive() override;
  virtual void OnDeactive() override;
  virtual bool OnCursorEvent(const CursorEvent&) override;
  virtual bool OnMouseButtonEvent(const MouseButtonEvent&) override;
  virtual bool OnDoubleClickEvent(const DoubleClickEvent&) override;

  void OnOK();
};
typedef Singleton<GSChooseLevel> TheGSChooseLevel;
}


