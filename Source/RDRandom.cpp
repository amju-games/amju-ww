#include <iostream>

// Using Mersenne Twister, see mt19937ar-cok.c

// Prototypes of c funcs in that file
extern "C"
{
/* initializes state[M_TWIST_N] with a seed */
void init_genrand(unsigned long s);

/* generates a random number on [0,0xffffffff]-interval */
unsigned long genrand_int32(void);

/* generates a random number on [0,1)-real-interval */
double genrand_real2(void);
}

//#define RAND_DEBUG

namespace Amju
{
void RDSRand(int seed)
{
  init_genrand(seed);
 
#ifdef RAND_DEBUG 
  std::cout << "==RDSRand " << seed << "\n";
#endif
}

// Returns value [0..1)
float RDRnd()
{
  float f = (float)genrand_real2();
#ifdef RAND_DEBUG 
  std::cout << "==RDSRnd: " << f << "\n";
#endif
  return f;
}

int RDRandom(int high)
{
  int i = genrand_int32() % high;
#ifdef RAND_DEBUG 
  std::cout << "==RDSRandom: " << i << "\n";
#endif
  return i;
}

}


