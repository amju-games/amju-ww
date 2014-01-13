#ifndef WW_GAME_OBJECT_H
#define WW_GAME_OBJECT_H

#include <GameObject.h>
#include <Matrix.h>
#include <SceneNode.h>
#include <Variable.h>
#include "SelectedNode.h"

namespace Amju
{
class ObjMesh;

class PropertiesDialog;

// Properties, so levels can be edited in game
// For each type, Property Keys are unique IDs specifying each property.
typedef int PropertyKey; 
// Values for properties
typedef Variable PropertyValue;

class WWGameObject : public GameObject
{
public:
  WWGameObject();

  // For Edit mode
  virtual WWGameObject* Clone() = 0;
  virtual bool Save(File* f) = 0;
  virtual void Move(const Vec3f& deltaPos);
  virtual void Reset() override;

  void SetDead(bool dead);
  bool IsDead() const;

  SceneNode* GetSceneNode();
  void SetSceneNode(RCPtr<SceneNode>);
  void AddSceneNodeToGraph();
  void RemoveSceneNodeFromGraph();

  // Load does not add Game Object to Game immediately - call this to do so
  virtual void AddToGame();
  // For Edit Mode, to remove an object
  virtual void RemoveFromGame();

  // Set AABB around m_pos with extents xsize, ysize, zsize
  void RecalcAABB(); 

  virtual void RotateY(float angleDegs);

  // Properties
  virtual void AddPropertiesGui(PropertiesDialog* dlg) = 0;
  virtual PropertyValue GetProp(PropertyKey) = 0;
  virtual void SetProp(PropertyKey, PropertyValue) = 0;

  // Edit mode
  void SetSelected(bool selected);
  bool IsSelected() const;

protected:
  // Create appropriate scene node type, load mesh and texture, etc.
  // Override for special scene nodes types like characters.
  virtual bool CreateSceneNode();

  // Convenience functions for Load/Save
  bool LoadMeshResource(File*);
  bool SaveMeshResource(File*); // m_meshFilename must be set
  bool LoadShadow(File*);
  bool SaveShadow(File*);

private:
  RCPtr<SceneNode> m_pSceneNode;

protected:
  bool m_isDead;

  Vec3f m_aabbExtents;
  bool m_extentsSet; // if set, use extents and recalc AABB

  std::string m_meshFilename;
  std::string m_shadowTexName;
  float m_shadowSize;

  Vec3f m_startPos;

  // Rotation - more for static floors, ramps etc
  float m_yRot;

  bool m_editModeIsSelected;
  RCPtr<SelectedNode> m_selNode;
};
}

#endif
