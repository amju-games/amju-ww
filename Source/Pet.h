#ifndef PET_H
#define PET_H

#include <SceneMesh.h>
#include "Npc.h"

namespace Amju
{
class Player;
class Dino;

class Pet : public Npc
{
public:
  static const char* NAME;

  Pet();
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void AddToGame() override;

  virtual void OnAnimFinished() override;
  virtual void OnWallCollision(const Vec3f& normal) override;

  bool JustDropped() const;
  void SetCarryingPlayer(Player* player);
  Player* GetCarryingPlayer();

  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

protected:
  float m_justDroppedTime;
  bool m_justDropped;

  Player* m_carryingPlayer;
};
}

#endif
