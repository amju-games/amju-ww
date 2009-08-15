#ifndef ON_FLOOR_H
#define ON_FLOOR_H

#include "BlinkCharacter.h"
#include "Vec2.h"
#include "AABB.h"

namespace Amju
{
class Floor;

class OnFloor : public BlinkCharacter
{
public:
  OnFloor();

  // Overrides
  virtual bool Load(File*);
  virtual void Reset(); 
  virtual void Update();
  virtual void Draw();
  virtual void DrawBlended();

  void SetFloor(Floor*); 

  bool IsDead() const;

  // List of all Floor objects this level
  static void AddFloor(Floor*);
  static void ClearFloors();

  void DrawShadow();

protected:
    void UpdatePhysics();

private:
  void SetTilt();

  // Set m_floor to point to floor under us, or 0 if we are lower than any floor
  void FindFloor();

  void UpdateAnim();
  void UpdateXZ();
  void UpdateY();

protected:
  // Sound effects
  enum Event
  {
    AMJU_EVENT_LANDED,
    AMJU_EVENT_FALL,
    AMJU_EVENT_COLLIDE,
    AMJU_EVENT_SLIDE,
    
    AMJU_EVENT_MAX
  };
  virtual void PlayWav(Event);

protected:
  // If true, we are on a floor, and not falling
  bool m_onFloor;

  // The floor/platform we are on
  Floor* m_floor;

  // Mass of this object, for physics
  float m_mass;

  // True when we have fallen below all Floors
  bool m_isDead;

  float m_shadowSize;

  // List of all Floor objects this level
  typedef std::vector<RCPtr<Floor> > Floors;
  static Floors s_floors;
};
}

#endif
