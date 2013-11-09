#ifndef PET_BONUS_STATE_H
#define PET_BONUS_STATE_H

#include <Singleton.h>
#include "GSText.h"
#include "Player.h"

namespace Amju
{
class GSPetBonus : public GSText, public NonCopyable
{
private:
  GSPetBonus();
  friend class Singleton<GSPetBonus>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive();
  virtual void Update();
  virtual void Draw();
  virtual void Draw2d();

  // Set the player who completed the level
  void SetPlayer(Player* p) { m_player = p; }

private:
  void ShowPet();

  RCPtr<Player> m_player;
  Pets m_pets;
  int m_petNum;
};
typedef Singleton<GSPetBonus> TheGSPetBonus;
}

#endif
