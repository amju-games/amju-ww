#ifndef ON_FLOOR_H
#define ON_FLOOR_H

#include <vector>
#include "WWGameObject.h"
#include "Vec2.h"
#include "AABB.h"
#include "Shadow.h"

namespace Amju
{
class Floor;

class OnFloor : public WWGameObject
{
public:
  OnFloor();

  // Overrides
  virtual bool Load(File*);
  virtual bool Save(File*);
  virtual void Reset(); 
  virtual void Update();

  void SetFloor(Floor*); 
  const Floor* GetFloor() const;

  virtual void OnWallCollision(const Vec3f& normal) {}

  // Return true if we are above a floor, i.e. on solid ground.
  bool IsOnFloor() const; 

  // List of all Floor objects this level
  static void AddFloor(Floor*);
  static void ClearFloors();

  // Returns true if character has non-zero vel due to user or AI control
  bool IsControlled() const;
  void SetIsControlled(bool);

  // Returns true if character is falling or jumping, i.e. in the air
  bool IsFalling() const;
  void SetIsFalling(bool);

  const Vec3f& GetOldPos() const;

  // Set m_floor to point to floor under us, or 0 if we are lower than any floor
  void FindFloor();

protected:
  void UpdatePhysics();
  void UpdateShadow();
  // Calc positive distance fallen
  float CalcDropFallen();

private:
  void SetTilt();
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

  // List of all Floor objects this level
  typedef std::vector<RCPtr<Floor> > Floors;
  static Floors s_floors;

  // True if velocity is non-zero, due to character walking or running.
  // False if due to falling, sliding or being pushed.
  bool m_isControlled;

  bool m_isFalling; // falling or jumping

  // All objects which are on a floor can cast a shadow onto it
  // TODO Move to WWGameObject ?
  //Shadow* m_shadow;

  // Keep track of pos last frame
  Vec3f m_oldPos;

  // The last known rotation, when we were on a floor.
  // Use this to rotate object when we are falling and no longer have
  //  a current floor.
  Matrix m_lastFloorRotation;

  float m_heightFallenFrom;
};
}

#endif
