#pragma once

#include <algorithm>

namespace Amju
{
// Set random seed
void RDSRand(int seed);

// Returns value 0..1
float RDRnd();

// For random shuffle, returns values >= 0 and < high
int RDRandom(int high);


// Cross-platform Random Shuffle
// From http://en.cppreference.com/w/cpp/algorithm/random_shuffle

template<class RandomIt, class RandomFunc>
void random_shuffle(RandomIt first, RandomIt last, RandomFunc&& r)
{
    typename std::iterator_traits<RandomIt>::difference_type i, n;
    n = last - first;
    for (i = n-1; i > 0; --i) {
        using std::swap;
        swap(first[i], first[r(i+1)]);
    }
}

template <class ITER>
void RDRandomShuffle(ITER first, ITER last)
{
  Amju::random_shuffle(first, last, RDRandom);
}

}


