#pragma once

#include <string>
#include "PlayerNum.h"

namespace Amju
{
// Get/Set nickname for the specified player. Stored in config file.
void SetNick(PlayerNum pn, const std::string& nick);
std::string GetNick(PlayerNum pn);
}

