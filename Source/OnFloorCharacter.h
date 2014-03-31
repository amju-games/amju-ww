#ifndef ON_FLOOR_CHARACTER_H
#define ON_FLOOR_CHARACTER_H

#include <SceneMesh.h>
#include "OnFloor.h"
#include "BloodFx.h"

namespace Amju
{
class OnFloorCharacter : public OnFloor
{
public:
  OnFloorCharacter();
  virtual void Update();
  virtual bool CreateSceneNode(); // Load MD2 and textures
  virtual void AddToGame() override; 

  virtual void AddPropertiesGui(PropertiesDialog* dlg) override;
  virtual PropertyValue GetProp(PropertyKey);
  virtual void SetProp(PropertyKey, PropertyValue);

  void SetAnim(const std::string& animName);

  // Set direction which character should face - we rotate to face this
  //  direction over time - DEGREES
  void SetDir(float degs);

  // Get direction which character is facing, or may be rotating to face
  // - DEGREES
  float GetDir() const;

  // Call to stop turning to face direction set in SetDir
  void StopRotating();

  // Callbacks - called from animated scene node
  virtual void OnAnimFinished();
  virtual void OnAnimFreeze();
  virtual void OnAnimRepeat();

  void SetIsTeleporting(bool isTeleporting);
  bool IsTeleporting() const  { return m_isTeleporting; }

  virtual void StartBeingEaten(OnFloorCharacter* eater);
  bool CanBeEaten() const;
  void ResetEatenState();

protected:
  void UpdateCocoon();

  void CalcBloodPoolMatrix();
  void UpdateBloodPoolRotation();

protected:
  float m_dir; // Direction of movement - DEGREES
  // Direction we currently face -- we will reduce the difference
  //  between m_dirCurrent and m_dir until we face the direction of movement.
  float m_dirCurrent; 

  // File names for animated character + 2 textures
  std::string m_md2Name;
  std::string m_texNames[2];  
  int m_anim;

  // Teleporting
  RCPtr<SceneMesh> m_cocoon;
  bool m_isTeleporting;
  float m_teleportScale;

  // Being Eaten
  enum EatenState { NOT_EATEN_YET, BEING_EATEN, HAS_BEEN_EATEN };
  EatenState m_eatenState;
  float m_eatenTime;
  RCPtr<SceneMesh> m_bloodPool;
  Vec3f m_bloodPoolPos;
  Vec2f m_bloodPoolXZSize;
  float m_bloodPoolScale;
  RCPtr<BloodFx> m_bloodFx;
  Matrix m_bloodPoolMatrix; // rotation matrix, depends on floor
  Matrix m_invFloorMatrix; // inv of rotation of floor when blood pool created
  Matrix m_floorRot; // rotation due to floor tilt relative to when blood pool created
};

typedef std::vector<OnFloorCharacter*> Characters;
void GetCharacters(Characters* characters);
}

#endif
