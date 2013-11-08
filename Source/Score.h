#pragma once

namespace Amju
{
class Score
{
public:
  enum PlayerNum
  {
    AMJU_P1,
    AMJU_P2
  };

  static void SetNumPlayers(int n);
  static int GetNumPlayers();

  static void Reset();
  static int GetScore(PlayerNum pn);
  static void AddToScore(PlayerNum pn, int toAdd);

  static int GetLives(PlayerNum pn);
  static void IncLives(PlayerNum pn);
  static void DecLives(PlayerNum pn);
};
}


