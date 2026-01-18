#ifndef ANIMATED_H_INCLUDED
#define ANIMATED_H_INCLUDED

#include "GameObject.h"
#include "Md2Model.h"
#include "Vec3.h"
#include "Shadow.h"

namespace Amju
{
class Animated : public GameObject
{
public:
  Animated();
  virtual void Draw();
  virtual void Update();
  void SetAnim(int anim);

  // Set direction which character should face - we rotate to face this
  //  direction over time
  void SetDir(float degs);

  // Returns true if character has non-zero vel due to user or AI control
  bool IsControlled() const;
  void SetIsControlled(bool);

  // Returns true if character is falling or jumping, i.e. in the air
  bool IsFalling() const;
  void SetIsFalling(bool);

protected:
  // No texture data here - we don't know how many textures 

  PMd2Model m_pModel;

  // All animated chars cast a shadow
  Shadow m_shadow;

private:
  float m_dir; // Direction of movement
  float m_dirCurrent; // Direction we currently face -- we will reduce the difference
   // between m_dirCurrent and m_dir until we face the direction of movement.
  float m_oldAngleDiff;

  int m_anim;
  // TODO Need next anim ?
  int m_frame;
  int m_nextFrame;
  float m_t; // varies from 0..1

  // True if velocity is non-zero, due to character walking or running.
  // False if due to falling, sliding or being pushed.
  bool m_isControlled;

  bool m_isFalling; // falling or jumping
};
}

#endif
