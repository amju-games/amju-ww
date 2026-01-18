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
  virtual const char* GetTypeName() const override;
  virtual WWGameObject* Clone() override;
  virtual void Update() override;
  virtual bool Load(File*) override;
  virtual bool Save(File*) override;
  virtual void AddToGame() override;
  virtual bool CreateSceneNode() override; 
  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey) override;
  virtual void SetProp(PropertyKey, PropertyValue) override;

  virtual bool YesAddToLevel(int levelId, float depth) override; 
  virtual void Customise(int levelId, float depth) override;

  void Eat(OnFloorCharacter*);
  bool IsEating() const;

protected:
  // Dinos have big heads so AABB is not symmetrical
  void UpdateAabb();

protected:
  enum DinoType { AMJU_DINO_GREEN, AMJU_DINO_BLUE, AMJU_DINO_RED };
  DinoType m_dinoType;

  // 2 more texture filenames, for when we are covered in blood from eating the player.
  std::string m_bloodTex[2];
};
}

#endif
