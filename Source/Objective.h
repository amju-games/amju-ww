#ifndef OBJECTIVE_H
#define OBJECTIVE_H

#include <string>
#include "GameObject.h"

namespace Amju
{
// Base class for the Objective for a balance game level
// This impl checks for all dead dinos 
// Subclasses can search for level-specific objectives
class Objective : public GameObject
{
public:
  static const char* NAME;

  Objective();

  // GameObject overrides
  virtual const char* GetTypeName() const;
  virtual bool Load(File*);
  virtual void Update();
  virtual void Reset();

protected:
  // Called by Update() when we have completed the objective for the level
  void ObjectiveComplete();

protected:
  bool m_isComplete;
  std::string m_text;
};
}

#endif
