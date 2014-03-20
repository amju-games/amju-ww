#include <GameObjectFactory.h>
#include <File.h>
#include <StringUtils.h>
#include "ProcGen.h"
#include "WWGameObject.h"
#include "SaveDir.h"

namespace Amju
{
ProcGen::ProcGen()
{
  m_numLayers = 0;
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

    Vec3f pos = ww->GetPos();
    pos.y -= depth;
    ww->SetPos(pos);

    ww->AddToGame();
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
