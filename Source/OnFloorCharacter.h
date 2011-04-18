#ifndef ON_FLOOR_CHARACTER_H
#define ON_FLOOR_CHARACTER_H

#include "OnFloor.h"

namespace Amju
{
class OnFloorCharacter : public OnFloor
{
public:
  OnFloorCharacter();
  virtual void Update();

  void SetAnim(const std::string& animName);

  // Set direction which character should face - we rotate to face this
  //  direction over time - DEGREES
  void SetDir(float degs);

  // Get direction which character is facing, or may be rotating to face
  // - DEGREES
  float GetDir() const;

  // Call to stop turning to face direction set in SetDir
  void StopRotating();

  // Callbacks - called from animated scene node
  virtual void OnAnimFinished();
  virtual void OnAnimFreeze();
  virtual void OnAnimRepeat();

protected:
  float m_dir; // Direction of movement - DEGREES
  float m_dirCurrent; // Direction we currently face -- we will reduce the difference
   // between m_dirCurrent and m_dir until we face the direction of movement.
};
}

#endif
