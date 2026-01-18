#pragma once

#include <string>
#include <vector>
#include <Singleton.h>
#include <GameObject.h>

namespace Amju
{
class ProcGen;
typedef Singleton<ProcGen> TheProcGen;

// Procedurally generate the level by adding "layers". 
// Each layer is loaded from disk up front, then is ready to go. 
// To add a layer to the level, give each object in the layer a new unique ID.
// Any layer can go under any other layer, (right?)
// Objects off the top of the screen should be deleted.
class ProcGen : public NonCopyable
{
private:
  ProcGen();
  friend TheProcGen;

public:
  void Init(); // Loads number of layers, filenames

  int GetNumLayers() const;
  bool OpenLayer(int layerNum); //const std::string& layerFilename);
  bool LoadLayerObject();
  bool IsLayerLoaded() const;

  void AddLayerToLevel(int layer, float depth); // ?

private:
  struct Layer
  {
    Layer() : m_numObjects(0) {}
    bool Open(const std::string& filename);
    bool LoadOneObject();
    void AddToGame(float depth);
    bool IsLoaded() const;

    typedef std::vector<PGameObject> Objects;
    Objects m_objects;

    int m_numObjects;

    RCPtr<File> m_file;
  };

  typedef std::vector<Layer*> Layers;
  Layers m_layers;

  int m_numLayers;
  // Filenames?
};
}
