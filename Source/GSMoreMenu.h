#pragma once

#include <Singleton.h>
#include "GSText.h"

namespace Amju 
{
class GSMoreMenu : public GSText
{
  GSMoreMenu();
  friend class Singleton<GSMoreMenu>;

public:
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();
  virtual void OnActive();

};
typedef Singleton<GSMoreMenu> TheGSMoreMenu;
} // namespace

