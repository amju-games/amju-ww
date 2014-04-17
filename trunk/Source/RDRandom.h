#pragma once

namespace Amju
{
// Set random seed
void RDSRand(int seed);

// Returns value 0..1
float RDRnd();

// For random shuffle, returns values >= 0 and < high
int RDRandom(int high);
}


