#pragma once

namespace Amju
{
class SceneNode;

SceneNode* CreateStars(const std::string& textureName, 
    float particlesize, int numparticles, float maxTime, float minY);
}