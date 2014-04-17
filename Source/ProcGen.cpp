#include <GameObjectFactory.h>
#include <File.h>
#include <StringUtils.h>
#include <ROConfig.h>
#include <Directory.h>
#include <FileImplGlue.h>
#include "ProcGen.h"
#include "WWGameObject.h"
#include "SaveDir.h"
#include "Depth.h"
#include "LevelManager.h"
#include "ShadowManager.h"
#include "RDRandom.h"

//#define SHADOW_DEBUG

namespace Amju
{
ProcGen::ProcGen()
{
  m_numLayers = 0;
  m_numLevels = 0;
  m_nextDepth = 0;
  m_nextLayer = -1;
}

int ProcGen::GetNumLayers() const
{
  return m_numLayers;
}

int ProcGen::GetNumLevels() const
{
  return m_numLevels;
}

void ProcGen::Init()
{
#if defined(WIN32) || defined(MACOSX)
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
//std::cout << "Got this dirent: " << de.m_name << "\n";
    if (de.m_name.size() > 5 && de.m_name.substr(0, 5) == "layer")
    {
//std::cout << " -- it's a layer file!\n";
      m_numLayers++;
    }
    else if (de.m_name.size() > 5 && de.m_name.substr(0, 5) == "level")
    {
      m_numLevels++;
    }
  }
#else
  // iOS/Android/(Wii?) - no editor, always load from glue file

  m_numLayers = 0;
  // Stat glue file for filenames starting "levels/layer"
  GlueFile* gf = FileImplGlue::GetGlueFile();
  Assert(gf);
  Strings strs;
  gf->Dir(&strs);
  int size = strs.size();
  for (int i = 0; i < size; i++)
  {
    const std::string& subfile = strs[i];
    if (subfile.size() >= 18 && subfile.substr(0, 12) == "levels/layer")
    {
      m_numLayers++;
    }
    else if (subfile.size() >= 18 && subfile.substr(0, 12) == "levels/level")
    {
      m_numLevels++;
    }
  }

#endif

  std::cout << "Total num levels = " << m_numLevels << "\n";
  std::cout << "Total num layers = " << m_numLayers << "\n";
}

bool ProcGen::OpenLayer(int layerNum) 
{
  Layer* layer = new Layer;
  m_layers.push_back(layer);

  std::string layerFilename;
#if defined(WIN32) || defined(MACOSX)
  layerFilename = GetSaveDir();
#endif
  
  layerFilename += "levels/layer-" + ToString(layerNum) + ".txt";

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

void ProcGen::CloseLayer()
{
  Assert(!m_layers.empty());
  Layer* layer = m_layers.back();
  layer->m_file = 0;
}

bool ProcGen::Layer::IsLoaded() const
{
  Assert(m_numObjects > 0); // ?
  Assert(m_numObjects >= (int)m_objects.size());
  bool loaded = (m_numObjects == (int)m_objects.size());
  return loaded;
}

bool ProcGen::Layer::Open(const std::string& layerFilename)
{
  bool HAS_VERSION_INFO = true;
  bool NOT_BINARY = false;
  bool useRoot = false;

  // On Mac and PC, level files are OS files so we can edit them
#if defined(WIN32) || defined(MACOSX)
  File::Impl impl = File::STD;
#else
  File::Impl impl = File::GLUE;
#endif

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
      pos.y -= depth; 
      clone->SetPos(pos);

      clone->AddToGame();
    }
  }
#ifdef SHADOW_DEBUG
  std::cout << TheShadowManager::Instance()->Report() << "\n";
#endif
}

void ProcGen::Reset()
{
  m_nextLayer = -1;
  m_nextDepth = 0;

  // Decide on set of layers which are active for this level
  static LevelManager* lm = TheLevelManager::Instance();
  int levelId = lm->GetLevelId();
  RDSRand(levelId << 10);

  // Random selection depends on level num
  // PROCGEN
  // Choose n (e.g. half) of the total set of layers as active for this level.
  // TODO +/- some random (level-dependent) value?
  int n = m_numLayers / 2;

  m_activeLayers.clear();
  // Pick <n> unique numbers between 0 and m_numLayers
  Ints ints;
  // Is there a STL way to do this loop?
  for (int i = 1; i < m_numLayers; i++) // NB starts at 1
  {
    ints.push_back(i);
  }
  // PROCGEN
  // Oh noes, different versions of std::random_shuffle give different shuffled results
  RDRandomShuffle(ints.begin(), ints.end());

  // Add some of the shuffled ints to the active list
  for (int i = 0; i < n; i++)
  {
    m_activeLayers.push_back(ints[i]);
  }
  // layer 0 ("layer-1.txt") is in every level. This is so we can
  //  guarantee that there is a teleporter in every level.
  m_activeLayers.push_back(0);

  // Finally, shuffle the active layers?

std::cout << "This level (" << levelId << ") is comprised of these layers: ";
for (int i = 0; i < (int)m_activeLayers.size(); i++)
{
  std::cout << m_activeLayers[i] << " ";
}
std::cout << "\n";
 
  PickNextLayer();
}

void ProcGen::PickNextLayer()
{
  // If m_nextLayer is -1, this is the first choice.

  // Otherwise, pick a layer depending on which ones are allowed to follow
  //  the current layer..?

  int num = m_activeLayers.size();

  // PROCGEN
  int r = RDRandom(num); // not: rand() % num; 
  m_nextLayer = m_activeLayers[r];

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
#ifdef PROC_GEN_DEBUG
std::cout << "Adding new layer now! cd = " << cd << "\n";
#endif

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
