#pragma once

#include <map>
#include <set>
#include <Singleton.h>
#include <Shadow.h>
#include "Floor.h"
#include "WWGameObject.h"

namespace Amju
{
class ShadowManager;
typedef Singleton<ShadowManager> TheShadowManager;

class ShadowManager
{
public:
  ShadowManager();

  void Clear();

  void AddFloor(Floor*);
  void RemoveFloor(Floor*);

  // Add a shadow casting game object. This creates a shadow scene node.
  void AddCaster(WWGameObject*, float size, const std::string& textureName);
  void RemoveCaster(WWGameObject*);

  void Update();

  // Set shadow visible/invisible for the given caster
  void SetShadowVisible(WWGameObject* caster, bool vis);

  // Report num casters, floors, etc 
  std::string Report() const;

private:
  bool m_first;

  // All objects which can have shadows cast on them
  typedef std::set<RCPtr<Floor> > Floors;

  // Map each caster in scene to its shadow node
  typedef std::map<RCPtr<WWGameObject>, RCPtr<Shadow> > CasterMap; 

  // For each floor, the set of casters which cast on to it
  typedef std::set<RCPtr<WWGameObject> > Casters;
  typedef std::map<RCPtr<Floor>, Casters> FloorToCasterMap;

  Floors m_floors;
  CasterMap m_casters;
  FloorToCasterMap m_floorToCasterMap;
};
}

