#include <ParticleEffect2d.h>
#include <AmjuRand.h>
#include "Stars.h"

namespace Amju
{
static int s_starId = 0;

class StarEffect : public ParticleEffect2d
{
public:
  virtual Vec3f NewPos() const override
  {
    int i = s_starId + 10;
    s_starId++;

    float r = (float)i * 0.02f; // radius
    float angle = (float)i * 0.6f;
    Vec3f tr(r * cos(angle), r * sin(angle), Rnd(-2.0f, -1.0f));
    return tr;
  }

  virtual float NewRot() const  override
  {
    return Rnd(-6.0f, 6.0f);
  }

  virtual float NewRotVel() const  override
  {
    return Rnd(-2.0f, 2.0f);
  }
};


SceneNode* CreateStars(const std::string& textureName, 
    float particlesize, int numparticles, float maxTime, float minY)
{
  srand(0); // 2 particle effects which we want to overlap - so set seed the same twice
  s_starId = 0;
  StarEffect* stars = new StarEffect;
  stars->Set(textureName, particlesize, numparticles, maxTime, minY);
  stars->Start();
  return stars;
}
}
