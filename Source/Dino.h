#ifndef DINO_H
#define DINO_H

#include "Npc.h"

namespace Amju
{
class Dino : public Npc
{
public:
  static const char* NAME;

  Dino();
  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File*);

protected:
  // Dinos have big heads so AABB is not symmetrical
  void UpdateAabb();

protected:
  // Timer - must reach limit, then we can decide what direction to move in etc.
  float m_decideTime;
  enum DinoType { AMJU_DINO_GREEN, AMJU_DINO_BLUE, AMJU_DINO_RED };
  DinoType m_dinoType;
};
}

#endif
