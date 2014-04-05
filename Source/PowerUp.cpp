#include <AmjuAssert.h>
#include <Timer.h>
#include <ROConfig.h>
#include <GuiCommandHandler.h>
#include "PowerUp.h"
#include "Player.h"
#include "Depth.h"

namespace Amju
{
static const int MAX_PLAYERS = 2;
static float powerUpTime[MAX_PLAYERS];
static PowerUp powerUps[MAX_PLAYERS];

// Classes for doing/undoing power up effect, can be GuiCommands.
static PGuiCommand commands[MAX_PLAYERS];

class PowerUpInvincible : public GuiCommand
{
public:
  PowerUpInvincible(int playerId) : m_playerId(playerId) {}

  bool Do() override
  {
std::cout << "Player " << m_playerId << " is invincible!\n";

    Player::GetPlayer((PlayerNum)m_playerId)->SetInvincible(true);
    return true;
  }
  
  void Undo() override
  {
    Player::GetPlayer((PlayerNum)m_playerId)->SetInvincible(false);
  }

private:
  int m_playerId;
};

class PowerUpPlayerVelMult : public GuiCommand
{
public:
  PowerUpPlayerVelMult(int playerId, float mult) : 
    m_playerId(playerId), m_mult(mult) {}

  bool Do() override
  {
std::cout << "Player " << m_playerId << " speed up: " << m_mult << "!\n";

    Player::GetPlayer((PlayerNum)m_playerId)->SetVelMult(m_mult);
    return true;
  }
  
  void Undo() override
  {
    Player::GetPlayer((PlayerNum)m_playerId)->SetVelMult(1);
  }

private:
  int m_playerId;
  float m_mult;
};

class PowerUpScrollSpeedMult : public GuiCommand
{
public:
  PowerUpScrollSpeedMult(float mult) : m_mult(mult) {}

  bool Do() override
  {
std::cout << "Scroll speed up: " << m_mult << "!\n";

    SetScrollSpeedMult(m_mult);
    return true;
  }

  void Undo() override
  {
    SetScrollSpeedMult(1);
  }

private:
  float m_mult;
};

void PowerUpManager::Update()
{
  float dt = TheTimer::Instance()->GetDt();
  for (int i = 0; i < MAX_PLAYERS; i++)
  {
    if (powerUpTime[i] > 0)
    {
#ifdef POWERUP_DEBUG
std::cout << "Power up for player " << i << " is active! " << powerUpTime[i] << "\n";
#endif
      powerUpTime[i] -= dt;
      if (powerUpTime[i] <= 0)
      {
        powerUpTime[i] = 0;

        powerUps[i] = POWERUP_NONE;
        // NOT: SetPowerUp(i, POWERUP_NONE);

        // Undo the power up effect here 
        commands[i]->Undo();
        commands[i] = nullptr;
#ifdef POWERUP_DEBUG
std::cout << "Power up for player " << i << " has just deactivated!\n";
#endif
      }
    }
  }
}

void PowerUpManager::SetPowerUp(int playerId, PowerUp pu)
{
  if (powerUpTime[playerId] > 0)
  {
    Assert(powerUps[playerId] != POWERUP_NONE);
  
    // Kill existing power up, right?
    Assert(commands[playerId]);
    commands[playerId]->Undo();
  }

  static const float POWER_UP_TIME = ROConfig()->GetFloat("power-up-time");
  powerUps[playerId] = pu;
  powerUpTime[playerId] = POWER_UP_TIME;

/*
  POWERUP_NONE,
  POWERUP_FASTER_PLAYER,
  POWERUP_SLOWER_SCROLLING,
  POWERUP_FASTER_SCROLLING, // bad power up!
  POWERUP_PLAYER_INVINCIBLE,
  POWERUP_POISON, // reverse controls = bad power up!
  POWERUP_SCROLL_DOWN, // ??
*/

  switch (pu)
  {
  case POWERUP_NONE:
    // Do nothing
    commands[playerId] = new PowerUpScrollSpeedMult(1); 
    break;
  case POWERUP_FASTER_PLAYER:
    commands[playerId] = new PowerUpPlayerVelMult(playerId, 2.0f); // TODO CONFIG
    break;
  case POWERUP_POISON:
    commands[playerId] = new PowerUpPlayerVelMult(playerId, -1.0f); 
    break;
  case POWERUP_SLOWER_SCROLLING:
    commands[playerId] = new PowerUpScrollSpeedMult(0.5f); // TODO CONFIG
    break;
  case POWERUP_FASTER_SCROLLING:
    commands[playerId] = new PowerUpScrollSpeedMult(1.5f); // TODO CONFIG
    break;
  case POWERUP_SCROLL_DOWN:
    commands[playerId] = new PowerUpScrollSpeedMult(-0.5f); // TODO CONFIG
    break;
  case POWERUP_PLAYER_INVINCIBLE:
    commands[playerId] = new PowerUpInvincible(playerId);
    break;
  }
  Assert(commands[playerId]);
  commands[playerId]->Do();
}

void PowerUpManager::ResetPowerUps()
{
  for (int i = 0; i < MAX_PLAYERS; i++)
  {
    powerUpTime[i] = 0;
    powerUps[i] = POWERUP_NONE;
    if (commands[i])
    {
      commands[i]->Undo(); // ? not sure if this is necessary
    }
    commands[i] = nullptr;
  }
}

Colour PowerUpManager::GetPlayerColour(int playerId)
{
  // Colours match the texture colour - TODO less clunky way of doing it
  static const Colour COLOURS[] = 
  {
    Colour(1, 1, 1, 1), // NONE
    Colour(1, 1, 0, 1), // bean1 - yellow
    Colour(1, 0, 0, 1), // bean2 - red
    Colour(0, 0, 1, 1), // bean 3 - blue
    Colour(1, 0, 1, 1), // bean 4 - purple
    Colour(0, 1, 0, 1), // bean 5 - green
    Colour(0.2f, 0, 0.2f, 1), // bean 6 - dark purple
  };

  // TODO first 0.5 of time, solid colour, then flash for 0.25, then flash
  //  quickly for 0.25.
  return COLOURS[(int)powerUps[playerId]];
}


}

