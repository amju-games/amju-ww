#pragma once

#include <GuiElement.h>

namespace Amju
{
// Prepend iphone- or ipad- to filename for iOS builds
PGuiElement WWLoadGui(const std::string& filename, bool addAsListener = true);
}

