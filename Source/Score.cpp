#include "Score.h"
#include "Hud.h"

namespace Amju
{
static int s_scores[2] = { 0, 0 };
static int s_lives[2] = { 3, 3 };
static int s_numPlayers = 0;

void UpdateHud()
{
  static Hud* h = TheHud::Instance();
  h->UpdateScores();
}

void Score::Reset()
{
  s_numPlayers = 0;

  for (int i = 0; i < 2; i++)
  {
    s_scores[i] = 0;
    s_lives[i] = 3; // TODO Get max lives from config
  }
  UpdateHud();
}

void Score::SetNumPlayers(int n)
{
  s_numPlayers = n;
  Assert(n > 0);
}

int Score::GetNumPlayers()
{
  Assert(s_numPlayers > 0);
  return s_numPlayers;
}

int Score::GetScore(PlayerNum pn)
{
  return s_scores[ (int)pn ];
}

void Score::AddToScore(PlayerNum pn, int toAdd)
{
  s_scores[ (int)pn ] += toAdd;
  UpdateHud();
}

int Score::GetLives(PlayerNum pn)
{
  return s_lives[ (int)pn ];
}

void Score::IncLives(PlayerNum pn)
{
  s_lives[ (int)pn ]++;
  UpdateHud();
}

void Score::DecLives(PlayerNum pn)
{
  s_lives[ (int)pn ]--;
  UpdateHud();
}

}

