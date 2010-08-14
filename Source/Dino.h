#ifndef DINO_H
#define DINO_H

#include "Npc.h"

namespace Amju
{
class Pet;

class Dino : public Npc
{
public:
  static const char* NAME;

  Dino();
  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File*);

  void Eat(Pet*);

protected:
  // Dinos have big heads so AABB is not symmetrical
  void UpdateAabb();

protected:
  enum DinoType { AMJU_DINO_GREEN, AMJU_DINO_BLUE, AMJU_DINO_RED };
  DinoType m_dinoType;
};
}

#endif
