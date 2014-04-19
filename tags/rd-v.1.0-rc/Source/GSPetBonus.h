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
  std::vector<Pet*> m_pets;
  int m_petNum;
  int m_scoreInc; // number of bonus points to award for the current pet

  int m_bonus; // current bonus being added to score
  int m_bonusPortion; // amount added to score/subtracted from m_bonus with each change
  enum State { WAITING, COUNTING, FINISHED };
  State m_state;
};
typedef Singleton<GSPetBonus> TheGSPetBonus;
}

#endif
