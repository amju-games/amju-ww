#include "GameMode.h"

namespace Amju
{
GameMode s_gameMode = AMJU_MODE_NOT_SET;

void SetGameMode(GameMode gm)
{
  s_gameMode = gm;
}

GameMode GetGameMode()
{
  return s_gameMode;
}

bool IsEditMode()
{
  return (s_gameMode == AMJU_EDIT_MODE);
}

bool IsAttractMode()
{
  return (s_gameMode == AMJU_ATTRACT_MODE);
}

}

