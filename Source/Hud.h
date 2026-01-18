#ifndef HUD_H
#define HUD_H

#include <Singleton.h>
#include <GuiElement.h>

namespace Amju
{
class Hud
{
public:
  bool Load();
  void Draw();
  void SetObjectiveText(const std::string&);
  void UpdateScores();
  void SetNumPlayers(int num);

private:
  PGuiElement m_gui;
};

typedef Singleton<Hud> TheHud;
}

#endif
