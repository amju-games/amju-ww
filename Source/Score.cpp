#include <Directory.h>
#include <ConfigFile.h>
#include "Score.h"
#include "Hud.h"

namespace Amju
{
static int s_scores[2] = { 0, 0 };
static int s_lives[2] = { 3, 3 };
static int s_numPlayers = 0;
static int hiScore = 0;
static std::string hiScoreName;
static const char* HI_SCORE_KEY = "hiscore";
static const char* HI_SCORE_NAME_KEY = "hiscorename";

void UpdateHud()
{
  static Hud* h = TheHud::Instance();
  h->UpdateScores();
}

Scores::Scores()
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  hiScore = gcf->GetInt(HI_SCORE_KEY);
  hiScoreName = gcf->GetValue(HI_SCORE_NAME_KEY);

std::cout << "Hi score: " << hiScore << " player: '" << hiScoreName << "'\n"; 
}

Scores::~Scores()
{
}

int Scores::GetHiScore() const
{
  return hiScore;
}

const std::string& Scores::GetHiScoreName() const
{
  return hiScoreName;
}

void Scores::Reset()
{
  s_numPlayers = 0;

  for (int i = 0; i < 2; i++)
  {
    s_scores[i] = 0;
    s_lives[i] = 3; // TODO Get max lives from config
  }
  UpdateHud();
}

void Scores::SetNumPlayers(int n)
{
  s_numPlayers = n;
  Assert(n > 0);
}

int Scores::GetNumPlayers() const
{
  Assert(s_numPlayers > 0);
  return s_numPlayers;
}

int Scores::GetScore(PlayerNum pn) const
{
  return s_scores[ (int)pn ];
}

void Scores::AddToScore(PlayerNum pn, int toAdd)
{
  s_scores[ (int)pn ] += toAdd;

  if (s_scores[ (int)pn ] > hiScore)
  {
    hiScore = s_scores[ (int)pn ];
    static GameConfigFile* gcf = TheGameConfigFile::Instance();
    gcf->SetInt(HI_SCORE_KEY, hiScore);
  }

  UpdateHud();
}

int Scores::GetLives(PlayerNum pn) const
{
  return s_lives[ (int)pn ];
}

void Scores::IncLives(PlayerNum pn)
{
  s_lives[ (int)pn ]++;
  UpdateHud();
}

void Scores::DecLives(PlayerNum pn)
{
  s_lives[ (int)pn ]--;
  UpdateHud();
}

}

