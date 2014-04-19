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
  void Init(); // Finds number of layers and levels

  int GetNumLayers() const;
  int GetNumLevels() const;

  // layerNum > 0, so 1 => "layer-1.txt" etc
  bool OpenLayer(int layerNum); 
  bool LoadLayerObject();
  bool IsLayerLoaded() const;
  void CloseLayer();

  // Called at the start of each level.
  // So this is the place to decide on the active layers for the current 
  //  level.
  void Reset();

  // Choose layer number for next time we add a layer to the level.
  void PickNextLayer();

  // Checks Depth to see if we should add the next layer 
  // When we add a layer, it is centred on xPos in the x axis.
  void AddLayerWhenReady(float xPos);

private:
  void AddLayerToLevel(int layer, float depth, float xPos); 

private:
  struct Layer
  {
    Layer() : m_numObjects(0) {}
    bool Open(const std::string& filename);
    bool LoadOneObject();
    void AddToGame(float depth, float x);
    bool IsLoaded() const;

    typedef std::vector<PGameObject> Objects;
    Objects m_objects;

    int m_numObjects;

    RCPtr<File> m_file;
  };

  typedef std::vector<Layer*> Layers;
  Layers m_layers;

  int m_numLayers;
  int m_numLevels;

  int m_nextLayer; 
  float m_nextDepth; // when we reach this depth, we add the above layer

  typedef std::vector<int> Ints;
  Ints m_activeLayers;
};
}
