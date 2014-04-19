#ifndef GS_LEVEL_COMPLETE_H
#define GS_LEVEL_COMPLETE_H

#include <GameState.h>
#include <Singleton.h>
#include <GuiImage.h>
#include "Player.h"
#include "GSText.h" // ??

namespace Amju
{
class GSLevelComplete : public GSText
{
private:
  GSLevelComplete();
  friend class Singleton<GSLevelComplete>;

public:
  virtual void Update() override;
  virtual void OnActive() override;
  virtual void OnDeactive() override;
  virtual void Draw() override;
  virtual void Draw2d() override;

  // Set the player who completed the level
  void SetPlayer(Player* p) { m_player = p; }

protected:
  float m_timer;
  RCPtr<Player> m_player;
  GuiImage m_bg;
  float m_z; // z-distance for effect
};
typedef Singleton<GSLevelComplete> TheGSLevelComplete;
}

#endif

