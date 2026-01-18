#ifndef CREATE_TEXT_H
#define CREATE_TEXT_H

#include "SceneNode.h"

namespace Amju
{
SceneNode* MakeChar(char k, float* width);

class TextMaker
{
public:
  virtual ~TextMaker() {}

  PSceneNode MakeText(const std::string& text);

protected:
  // Override to do something fancy to letters. 
  // Each character has Decorate called on it.
  virtual PSceneNode Decorate(PSceneNode p) { return p; }
};
}

#endif


