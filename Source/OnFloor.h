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
  virtual void Reset(); 
  virtual void Update();
  virtual AABB* GetAABB();

  void SetFloor(Floor*); 
  const Floor* GetFloor() const;

  bool IsDead() const;

  // List of all Floor objects this level
  static void AddFloor(Floor*);
  static void ClearFloors();

  // Returns true if character has non-zero vel due to user or AI control
  bool IsControlled() const;
  void SetIsControlled(bool);

  // Returns true if character is falling or jumping, i.e. in the air
  bool IsFalling() const;
  void SetIsFalling(bool);

protected:
  void UpdatePhysics();
  void UpdateShadow();
  bool LoadShadow(File* f);

  // Set m_floor to point to floor under us, or 0 if we are lower than any floor
  void FindFloor();

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

  // True when we have fallen below all Floors
  bool m_isDead;

  // List of all Floor objects this level
  typedef std::vector<RCPtr<Floor> > Floors;
  static Floors s_floors;

  // True if velocity is non-zero, due to character walking or running.
  // False if due to falling, sliding or being pushed.
  bool m_isControlled;

  bool m_isFalling; // falling or jumping

  // All objects which are on a floor have a node in the Scene Graph
  SceneNode* m_pSceneNode;

  // All objects which are on a floor can cast a shadow onto it
  Shadow* m_shadow;
};
}

#endif
