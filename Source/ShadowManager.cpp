#include <sstream>
#include "ShadowManager.h"
#include "MySceneGraph.h"
#include "Describe.h"

//#define SHADOW_MGR_DEBUG

namespace Amju
{
ShadowManager::ShadowManager()
{
  m_first = true;
}

void ShadowManager::Clear()
{
  m_floors.clear();
  m_casters.clear();
  m_floorToCasterMap.clear();
  m_first = true;
}

std::string ShadowManager::Report() const
{
  std::stringstream s;
  s << "Casters: " << m_casters.size() << " floors: " << m_floors.size() << " floor2casters: " << m_floorToCasterMap.size();
  return s.str();
}

void ShadowManager::SetShadowVisible(WWGameObject* obj, bool vis)
{
  if (m_casters.find(obj) != m_casters.end())
  {
    Shadow* shadow = m_casters[obj];
    shadow->SetVisible(vis);
  }
}

void ShadowManager::RemoveFloor(Floor* floor)
{
  for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
  {
    Shadow* shadow = it->second; 
    shadow->EraseCollisionMesh(floor->GetCollisionMesh());
  }
  m_floors.erase(floor);
}

void ShadowManager::AddFloor(Floor* floor)
{
  m_floors.insert(floor);

  for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
  {
    // TODO Check if caster overlaps floor
    //WWGameObject* go = it->first;
    Shadow* shadow = it->second;
 
    shadow->AddCollisionMesh(floor->GetCollisionMesh());
  }

#ifdef SHADOW_MGR_DEBUG
std::cout << "Shadow mgr: added floor " << floor->GetTypeName()
  << " ID: " << floor->GetId() << "\n";
#endif
}

void ShadowManager::RemoveCaster(WWGameObject* obj)
{
#ifdef SHADOW_MGR_DEBUG
std::cout << "Shadows: removing " << Describe(obj) << "\n";
#endif

  if (m_casters.find(obj) == m_casters.end())
  {
    return;
  }

  Shadow* shadow = m_casters[obj];

  // Remove scene node
  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->DelChild(shadow);

  // Remove from m_casters
  m_casters.erase(obj);

  // Remove from list of casters for each floor
  for (auto it = m_floorToCasterMap.begin(); it != m_floorToCasterMap.end(); ++it)
  {
    Casters& casters = it->second;
    casters.erase(obj);
  }
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
  shadow->SetHeightRange(200, 100); // Adjust so shadows not cast on distant floors

  SceneNode* root = GetGameSceneGraph()->GetRootNode(SceneGraph::AMJU_OPAQUE);
  root->AddChild(shadow);
  m_casters.insert(std::make_pair(obj, shadow));
      
  for (auto ft = m_floors.begin(); ft != m_floors.end(); ++ft)
  {
    Floor* floor = *ft;
    shadow->AddCollisionMesh(floor->GetCollisionMesh());
  }

#ifdef SHADOW_MGR_DEBUG
std::cout << "Shadow mgr: added caster (" << obj->GetTypeName()
  << ") ID: " << obj->GetId() << "\n";
#endif
}

void ShadowManager::Update()
{
  // On first update, find all casters for each floor
  if (m_first)
  {
    m_first = false;
  
    // For each floor, add its collision mesh to all casters which overlap
    for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
    {
      // TODO Check if caster overlaps floor
      WWGameObject* go = it->first;
      Shadow* shadow = it->second;

      Matrix mat;
      Vec3f p = go->GetPos();
      mat.Translate(p);
      shadow->SetLocalTransform(mat);
      shadow->CombineTransform();

      static const float S = 10.0f;
      AABB aabb(p.x - S, p.x + S, p.y - S, p.y + S, p.z - S, p.z + S);
      shadow->SetAABB(aabb);

      for (auto ft = m_floors.begin(); ft != m_floors.end(); ++ft)
      {
        Floor* floor = *ft;

#ifdef SHADOW_MGR_DEBUG
std::cout << "Shadow mgr: caster ID: " << go->GetId() 
  << " casts onto floor ID: " << floor->GetId() << "\n";
#endif

        shadow->AddCollisionMesh(floor->GetCollisionMesh());
      }
    }
  }

  // If a shadow caster moves, update its shadow transform matrix,
  //  and for each floor, check if it casts a shadow onto it.
  // NB Make sure AABB is updated so not culled
  for (auto it = m_casters.begin(); it != m_casters.end(); ++it)
  {
    WWGameObject* go = it->first;
    Shadow* shadow = it->second;
    Matrix mat;
    Vec3f p = go->GetPos();
    mat.Translate(p);
    shadow->SetLocalTransform(mat);

    static const float S = 10.0f;
    AABB aabb(p.x - S, p.x + S, p.y - S, p.y + S, p.z - S, p.z + S);
    shadow->SetAABB(aabb);
    //shadow->Recalc();
  }

/*
  // If a floor moves, recalc all the shadows which are casting on to it
  for (auto it = m_floorToCasterMap.begin(); it != m_floorToCasterMap.end(); ++it)
  {
    Floor* f = it->first;
//    if (f->DidMove())
    {
      // Update shadow casters
      Casters& casters = it->second;
      for (auto jt = casters.begin(); jt != casters.end(); 
           // inc in loop 
          )
      {
        WWGameObject* go = *jt;
        // Is the shadow still casting onto this floor? 
        // Check AABB against floor AABB (or its collision mesh)

        // If so, recalc; if not, remove from this set.

        ++jt;
      }
    }
  }
*/
}

}

