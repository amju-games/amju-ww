#pragma once

#include <Singleton.h>

namespace Amju
{
class Scores;
typedef Singleton<Scores> TheScores;

enum PlayerNum
{
  AMJU_P1,
  AMJU_P2
};

class Scores : public NonCopyable
{
private:
  Scores();
  friend TheScores;

public:
  ~Scores();

  void SetNumPlayers(int n);
  int GetNumPlayers() const;

  void Reset();
  int GetScore(PlayerNum pn) const;
  void AddToScore(PlayerNum pn, int toAdd);

  int GetLives(PlayerNum pn) const;
  void IncLives(PlayerNum pn);
  void DecLives(PlayerNum pn);

  int GetHiScore() const;
  const std::string& GetHiScoreName() const;
};
}


