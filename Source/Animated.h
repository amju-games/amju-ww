#ifndef ANIMATED_H_INCLUDED
#define ANIMATED_H_INCLUDED

#include "SceneNode.h"
#include "Md2Model.h"
#include "Vec3.h"
#include "Shadow.h"

namespace Amju
{
class Animated : public SceneNode
{
public:
  Animated();
  virtual void Draw();
  virtual void Update();
  void SetAnim(int anim);

  // Set direction which character should face - we rotate to face this
  //  direction over time
  void SetDir(float degs);
  // Get direction which character is facing, or may be rotating to face
  float GetDir() const;

  bool LoadMd2(const std::string& md2name);

protected:
  // No texture data here - we don't know how many textures 

  PMd2Model m_pModel;

  // All animated chars cast a shadow
  // TODO Separate SceneNode
  Shadow m_shadow;

  float m_dir; // Direction of movement
  float m_dirCurrent; // Direction we currently face -- we will reduce the difference
   // between m_dirCurrent and m_dir until we face the direction of movement.
  float m_oldAngleDiff;

private:
  int m_anim;
  // TODO Need next anim ?
  int m_frame;
  int m_nextFrame;
  float m_t; // varies from 0..1
};
}

#endif
