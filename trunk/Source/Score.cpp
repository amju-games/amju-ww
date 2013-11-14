#include <Directory.h>
#include "Score.h"
#include "Hud.h"

namespace Amju
{
static int s_scores[2] = { 0, 0 };
static int s_lives[2] = { 3, 3 };
static int s_numPlayers = 0;
static int hiScore = 0;
static std::string hiScoreName;

static const char* APPNAME = "amju-ww";

void UpdateHud()
{
  static Hud* h = TheHud::Instance();
  h->UpdateScores();
}

static std::string Filename()
{
  std::string filename = GetSaveDir(APPNAME) + "hiscores.txt";
std::cout << "Hi scores file: " << filename << "\n";
  return filename;
}

Scores::Scores()
{
  // Load hi score(s)
  // File has version and is standard type, (i.e. not glue file)
  File f(true, File::STD);
  if (!f.OpenRead(Filename(), File::BINARY, false))
  {
    return;
  }
  if (!f.GetDataLine(&hiScoreName))
  {
std::cout << "Failed to read name from hi score file\n";
    return;
  }  
  if (!f.GetInteger(&hiScore))
  {
std::cout << "Failed to read score from hi score file\n";
    return;
  }
  // TODO Read checksum??

std::cout << "Hi score: " << hiScore << " player: '" << hiScoreName << "'\n"; 
}

Scores::~Scores()
{
  // Save hi score(s)
std::cout << "Saving hi scores...\n";
  File f(true, File::STD);
  if (!f.OpenWrite(Filename(), 1, true, false, true))
  {
std::cout << "FAILED to open hi scores file for writing!\n";
    return;
  }
  f.Write(hiScoreName.empty() ? "$$$empty" : hiScoreName);
  f.WriteInteger(hiScore);
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

