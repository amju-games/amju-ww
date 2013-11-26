#pragma once

namespace Amju
{
enum GameMode 
{
  AMJU_MODE_NOT_SET, 
  AMJU_MAIN_GAME_MODE, 
  AMJU_ATTRACT_MODE, 
  AMJU_EDIT_MODE 
};

void SetGameMode(GameMode);
GameMode GetGameMode(); 
bool IsEditMode();
bool IsAttractMode();
}

