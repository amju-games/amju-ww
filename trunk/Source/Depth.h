#pragma once

namespace Amju
{
// Depth is how far the level has scrolled up. 
// It's a positive value, (though the deeper we go, the more negative the y-coord)

void ResetDepth();

float GetCurrentDepth();

// Update (increase) depth, but maintain a minimum value
void DepthUpdate(float minDepth);

// TODO Should we need this?
void IncreaseDepth(float depth);
}
