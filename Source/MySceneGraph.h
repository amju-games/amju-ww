#ifndef MY_SCENE_GRAPH_H
#define MY_SCENE_GRAPH_H

#include <SceneGraph.h>

namespace Amju
{
// Functions to get the SceneGraphs used in this game
SceneGraph* GetTextSceneGraph(); // for title page, menus, etc
SceneGraph* GetGameSceneGraph(); // for main game state
}

#endif
