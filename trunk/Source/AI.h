#ifndef AI_H
#define AI_H

#include <RCPtr.h>

namespace Amju
{
class Npc;
class GameObject;

// Base class for AI states for NPCs
class AI : public RefCounted
{
public:
  AI();
  virtual const char* GetName() const = 0;

  // Updates timer
  virtual void Update() = 0;

  // Resets timer
  virtual void OnActivated();

  virtual void OnDeactivated() {}

  // Return float - higher means this AI is better
  virtual float GetRank();

  void SetNpc(Npc* npc);
  // Most AI behaviours involve some other target, e.g. to chase or avoid
  void SetTarget(GameObject*);

protected:
  Npc* m_npc;
  GameObject* m_target;
  float m_time; // time since activated
  float m_rank; // default rank 
};

typedef RCPtr<AI> PAI;
}

#endif
