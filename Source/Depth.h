#pragma once

namespace Amju
{
// Depth is how far the level has scrolled up. 
// It's a positive value, (though the deeper we go, the more negative the y-coord)

void ResetDepth();

float GetCurrentDepth();

void DepthUpdate();

// TODO Should we need this?
void IncreaseDepth(float depth);
}