#include <GameObjectFactory.h>
#include <File.h>
#include <StringUtils.h>
#include <ROConfig.h>
#include <Directory.h>
#include "ProcGen.h"
#include "WWGameObject.h"
#include "SaveDir.h"
#include "Depth.h"
#include "LevelManager.h"

namespace Amju
{
ProcGen::ProcGen()
{
  m_numLayers = 0;
  m_nextDepth = 0;
  m_nextLayer = -1;
}

int ProcGen::GetNumLayers() const
{
  return m_numLayers;
}

void ProcGen::Init()
{
  // Get number of files which start "levels/layer"
  // Don't use glue file, as these files are copied to OS files

  DirEnts dirents;
  const bool NO_GLUE = false;
  std::string dir = GetSaveDir() + "levels/";
  if (!Dir(dir, & dirents, NO_GLUE))
  {
    std::cout << "Couldn't dir " << dir << "\n";
    Assert(0);
  }

  for (int i = 0; i < (int)dirents.size(); i++)
  {
    DirEnt de = dirents[i];
std::cout << "Got this dirent: " << de.m_name << "\n";
    if (de.m_name.size() > 5 && de.m_name.substr(0, 5) == "layer")
    {
std::cout << " -- it's a layer file!\n";
      m_numLayers++;
    }
  }
  std::cout << "total num layers = " << m_numLayers << "\n";
}

bool ProcGen::OpenLayer(int layerNum) //const std::string& layerFilename)
{
  Layer* layer = new Layer;
  m_layers.push_back(layer);

  std::string layerFilename = GetSaveDir() + "levels/layer-" + ToString(layerNum) + ".txt";

  if (!layer->Open(layerFilename))
  {
    return false;
  }
  return true;
}

bool ProcGen::LoadLayerObject()
{
  Assert(!m_layers.empty());
  Layer* layer = m_layers.back();
  return layer->LoadOneObject();
}

bool ProcGen::IsLayerLoaded() const
{
  Assert(!m_layers.empty());
  Layer* layer = m_layers.back();
  return layer->IsLoaded();
}

bool ProcGen::Layer::IsLoaded() const
{
  Assert(m_numObjects > 0); // ?
  Assert(m_numObjects >= (int)m_objects.size());
  return (m_numObjects == (int)m_objects.size());
}

bool ProcGen::Layer::Open(const std::string& layerFilename)
{
  bool HAS_VERSION_INFO = true;
  bool NOT_BINARY = false;
  bool useRoot = false;
  File::Impl impl = File::STD;

  m_file = new File(HAS_VERSION_INFO, impl);

  if (!m_file->OpenRead(layerFilename, NOT_BINARY, useRoot))
  {
    Assert(0);
    return false;
  }

  if (!m_file->GetInteger(&m_numObjects))
  {
    m_file->ReportError("Expected number of objects");
    m_file = 0;
    return false;
  }

  return true;
}

bool ProcGen::Layer::LoadOneObject()
{
  std::string s;
  if (!m_file->GetDataLine(&s))
  {
    m_file->ReportError("Expected game object type");
    return false;
  }

  RCPtr<GameObject> go = TheGameObjectFactory::Instance()->Create(s);
  if (!go)
  {
    m_file->ReportError("Can't create game object: " + s);
    return false;
  }

  if (!go->Load(m_file))
  {
    m_file->ReportError("Failed to load game object: " + s);
    return false;
  }

  // Check
  if (!m_file->GetDataLine(&s))
  {
    m_file->ReportError("Expected final line after game object");
    return false;
  }

  if (s != "end")
  {
    m_file->ReportError("Expected \"end\" here");
    return false;
  }

  m_objects.push_back(go);

  return true;
}

void ProcGen::Layer::AddToGame(float depth, float x)
{
  static LevelManager* lm = TheLevelManager::Instance();
  int levelId = lm->GetLevelId();

  float xPos = 0;
/*
  if (x > 300) // TODO TEMP TEST
  {
    xPos = 300.0f;
  }
  else if (x < -300)
  {
    xPos = -300.0f;
  }
*/
  int s = m_objects.size();
  for (int i = 0; i < s; i++)
  {
    GameObject* go = m_objects[i];
    WWGameObject* ww = dynamic_cast<WWGameObject*>(go);
    Assert(ww);

    if (ww->YesAddToLevel(levelId, depth))
    {
      RCPtr<WWGameObject> clone = ww->Clone();
      int id = TheLevelManager::Instance()->GetUniqueId();
      clone->SetId(id);

      // Procedurally change appearance etc depending on type
      clone->Customise(levelId, depth); // any other info?

      Vec3f pos = clone->GetPos();
      pos.x += xPos;
//    pos.y  = - (pos.y + depth);
      pos.y -= depth; // ?
      clone->SetPos(pos);

      clone->AddToGame();
    }
  }
}

void ProcGen::Reset()
{
  m_nextLayer = -1;
  m_nextDepth = 0;
  PickNextLayer();
}

void ProcGen::PickNextLayer()
{
  // If m_nextLayer is -1, this is the first choice.

  // Otherwise, pick a layer depending on which ones are allowed to follow
  //  the current layer..?

//  m_nextLayer = rand() % m_numLayers; 

  // Just in sequence, starting randomly
  if (m_nextLayer == -1)
  {
    m_nextLayer = rand() % m_numLayers; 
  }
  m_nextLayer++;
  if (m_nextLayer >= m_numLayers)
  {
    m_nextLayer = 0;
  }

  float layerHeight = 260;
  // Should be layer height + a gap to get through
   // TODO TEMP TEST should be data, depending on layer above

  m_nextDepth = m_nextDepth + layerHeight; 
}

void ProcGen::AddLayerWhenReady(float xPos)
{
  Assert(m_nextLayer > -1);

  static const float nextLayerHeightOffset = ROConfig()->GetFloat("next-layer-height-offset");

  float cd = GetCurrentDepth();
  if (cd + nextLayerHeightOffset > m_nextDepth)
  {
std::cout << "Adding new layer now! cd = " << cd << "\n";
    AddLayerToLevel(m_nextLayer, m_nextDepth, xPos); 
    PickNextLayer();
  }
}

void ProcGen::AddLayerToLevel(int layerIndex, float depth, float x)
{
  // Pick out Layer. Add new unique IDs to all objects, then add to Game.
  // Subtract depth from all position y-coords
  Assert(layerIndex >= 0 && layerIndex < (int)m_layers.size());
  Layer* layer = m_layers[layerIndex];
  Assert(layer);
  layer->AddToGame(depth, x);
}

}
