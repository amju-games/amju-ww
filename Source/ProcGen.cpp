#include <GameObjectFactory.h>
#include <File.h>
#include <StringUtils.h>
#include <ROConfig.h>
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
  m_numLayers = 2; // TODO
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
  bool useRoot = true;
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

void ProcGen::Layer::AddToGame(float depth)
{
  int s = m_objects.size();
  for (int i = 0; i < s; i++)
  {
    GameObject* go = m_objects[i];
    WWGameObject* ww = dynamic_cast<WWGameObject*>(go);
    Assert(ww);

    RCPtr<WWGameObject> clone = ww->Clone();
    int id = TheLevelManager::Instance()->GetUniqueId();
    clone->SetId(id);

    Vec3f pos = clone->GetPos();
    pos.y  = - (pos.y + depth);
    clone->SetPos(pos);

    clone->AddToGame();
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
  static int i = 0;
  i++;
  if (i > 1)
  {
    i = 0;
  }

  // If m_nextLayer is -1, this is the first choice.

  // Otherwise, pick a layer depending on which ones are allowed to follow
  //  the current layer..?

  m_nextLayer = i; // TODO Random, but based on which layers are allowed to come after the most recent layer.
  float layerHeight = 500; // TODO TEMP TEST should be data, depending on layer above

  m_nextDepth = m_nextDepth + layerHeight; 
}

void ProcGen::AddLayerWhenReady()
{
  Assert(m_nextLayer > -1);

  static const float nextLayerHeightOffset = ROConfig()->GetFloat("next-layer-height-offset");

  float cd = GetCurrentDepth();
  if (cd + nextLayerHeightOffset > m_nextDepth)
  {
std::cout << "Adding new layer now! cd = " << cd << "\n";
    AddLayerToLevel(m_nextLayer, m_nextDepth); // + nextLayerHeightOffset);
    PickNextLayer();
  }
}

void ProcGen::AddLayerToLevel(int layerIndex, float depth)
{
  // Pick out Layer. Add new unique IDs to all objects, then add to Game.
  // Subtract depth from all position y-coords
  Assert(layerIndex >= 0 && layerIndex < (int)m_layers.size());
  Layer* layer = m_layers[layerIndex];
  Assert(layer);
  layer->AddToGame(depth);
}

}
