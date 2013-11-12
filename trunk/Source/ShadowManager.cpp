#include "ShadowManager.h"
#include "MySceneGraph.h"

namespace Amju
{
void ShadowManager::Clear()
{
  m_floors.clear();
  m_casters.clear();
  m_floorToCasterMap.clear();
}

void ShadowManager::AddFloor(Floor* floor)
{
  m_floors.insert(floor);

  // TEMP TEST - add floor collision mesh for all shadow casters
  for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
  {
    Shadow* shadow = it->second;
    shadow->AddCollisionMesh(floor->GetCollisionMesh());
  }
}

void ShadowManager::RemoveCaster(WWGameObject* obj)
{
  // Remove from m_casters

  // Remove from list of casters for each floor
}

void ShadowManager::AddCaster(WWGameObject* obj, float size, 
  const std::string& textureName)
{
  Texture* tex = (Texture*)TheResourceManager::Instance()->GetRes(textureName);
  if (!tex)
  {
std::cout << "Failed to load shadow texture: " << textureName << "\n";
    Assert(0);
    return;
  }

  Assert(m_casters.find(obj) == m_casters.end());
  // Create Shadow node for this caster
  Shadow* shadow = new Shadow;
  shadow->SetSize(size);
  shadow->SetTexture(tex);
  shadow->SetHeightRange(1000, 1000);

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(shadow);
  m_casters.insert(std::make_pair(obj, shadow));
}

void ShadowManager::Update()
{
  // On first update, find all casters for each floor

  // If a shadow caster moves, update its shadow transform matrix,
  //  and for each floor, check if it casts a shadow onto it.
  // NB Make sure AABB is updated so not culled
  for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
  {
    WWGameObject* go = it->first;
    Shadow* shadow = it->second;
    Matrix mat;
    mat.Translate(go->GetPos());
    shadow->SetLocalTransform(mat);
  }

  // If a floor moves, recalc all the shadows which are casting on to it
  for (auto it = m_floorToCasterMap.begin(); it != m_floorToCasterMap.end(); ++it)
  {
    Floor* f = it->first;
//    if (f->DidMove())
    {
      // Update shadow casters
      Casters& casters = it->second;
      for (auto jt = casters.begin(); jt != casters.end(); /* inc in loop */)
      {
        WWGameObject* go = *jt;
        // Is the shadow still casting onto this floor? 
        // Check AABB against floor AABB (or its collision mesh)

        // If so, recalc; if not, remove from this set.

        ++jt;
      }
    }
  }

}

}

