#pragma once

#include <Singleton.h>
#include <Colour.h>

namespace Amju
{
// Power up functions:
// Power ups are temporary changes to game state, which revert after a 
//  time limit.
// Player can be tinted a different colour by the current power up.

enum PowerUp 
{ 
  POWERUP_NONE,
  POWERUP_FASTER_PLAYER,
  POWERUP_SLOWER_SCROLLING,
  POWERUP_FASTER_SCROLLING, // bad power up!
  POWERUP_PLAYER_INVINCIBLE,
  POWERUP_POISON, // reverse controls = bad power up!
  POWERUP_SCROLL_DOWN, // ??
};

class PowerUpManager
{
public:
  void Update();
  void SetPowerUp(int playerId, PowerUp);
  void ResetPowerUps();
  Colour GetPlayerColour(int playerId);
};

typedef Singleton<PowerUpManager> ThePowerUpManager;
} // namespace

