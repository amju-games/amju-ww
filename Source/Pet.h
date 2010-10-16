#ifndef PET_H
#define PET_H

#include "Npc.h"

namespace Amju
{
class Pet : public Npc
{
public:
  static const char* NAME;

  Pet();
  virtual const char* GetTypeName() const;
  virtual void Update();
  virtual bool Load(File*);

  void OnEaten();

protected:
  Shadow* m_bloodPool;
};
}

#endif
