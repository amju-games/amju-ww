#ifndef PET_H
#define PET_H

#include "Npc.h"

namespace Amju
{
class Player;

class Pet : public Npc
{
public:
  static const char* NAME;

  Pet();
  virtual const char* GetTypeName() const;
  virtual WWGameObject* Clone() override;
  virtual void Update();
  virtual bool Load(File*);
  virtual bool Save(File*);

  void OnEaten();

  void SetCarryingPlayer(Player* player);
  Player* GetCarryingPlayer();

protected:
  Shadow* m_bloodPool;

  Player* m_carryingPlayer;
};
}

#endif
