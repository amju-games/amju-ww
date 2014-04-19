#pragma once

#include <Singleton.h>
#include "PlayerNum.h"

namespace Amju
{
class Scores;
typedef Singleton<Scores> TheScores;

class Scores : public NonCopyable
{
private:
  Scores();
  friend class Singleton<Scores>;

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


