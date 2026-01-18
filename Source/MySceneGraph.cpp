#include "MySceneGraph.h"

namespace Amju
{
template <class T>
T* CreateOnHeap()
{
  T* t = new T;
  // TODO atexit Destroy
  return t;
}

SceneGraph* GetTextSceneGraph()
{
  static SceneGraph* sg = CreateOnHeap<SceneGraph>();
  return sg;
}

SceneGraph* GetGameSceneGraph()
{
  static SceneGraph* sg = CreateOnHeap<SceneGraph>();
  return sg;
}
}
