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

// This impl of random_shuffle is from MSVC 2010 - the idea is to get the same shuffle 
//  across multiple platforms.
template<class _RanIt,
	class _Fn1,
	class _Diff> inline
	void _Random_shuffle(_RanIt _First, _RanIt _Last, _Fn1& _Func, _Diff *)
	{	// shuffle nonempty [_First, _Last) using random function _Func
	_RanIt _Next = _First;
	for (_Diff _Index = 2; ++_Next != _Last; ++_Index)
		_STD iter_swap(_Next, _First + _Diff(_Func(_Index) % _Index));
	}

template<class _RanIt,
	class _Fn1> inline
	void random_shuffle(_RanIt _First, _RanIt _Last, _Fn1& _Func)
	{	// shuffle [_First, _Last) using random function _Func
//	_DEBUG_RANGE(_First, _Last);
//	_DEBUG_POINTER(_Func);
	if (_First != _Last)
		_Random_shuffle(_Unchecked(_First), _Unchecked(_Last), _Func,
			_Dist_type(_First));
	}

template <class ITER>
void RDRandomShuffle(ITER first, ITER last)
{
  Amju::random_shuffle(first, last, RDRandom);
}

}


