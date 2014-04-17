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


namespace Amju
{
void RDSRand(int seed)
{
  init_genrand(seed);
  
  std::cout << "==RDSRand " << seed << "\n";
}

// Returns value [0..1)
float RDRnd()
{
  float f = (float)genrand_real2();
  std::cout << "==RDSRnd: " << f << "\n";
  return f;
}

int RDRandom(int high)
{
  int i = genrand_int32() % high;
  std::cout << "==RDSRandom: " << i << "\n";
  return i;
}

}


