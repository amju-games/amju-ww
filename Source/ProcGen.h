#pragma once

#include <string>
#include <vector>
#include <Singleton.h>
#include <GameObject.h>

/*
TODO
Each layer needs to say which layers it can follow (go underneath), and at what depth -- i.e. how far underneath.
AND say what layers can go underneath it? -> we want to be able to add more layer files, which integrate with existing.
*/

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

  void Reset();
  void PickNextLayer();

  // Checks Depth to see if we should add the next layer 
  void AddLayerWhenReady();

private:
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

  int m_nextLayer; 
  float m_nextDepth; // when we reach this depth, we add the above layer
};
}
