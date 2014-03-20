#pragma once

#include <Singleton.h>
#include "GSText.h"

namespace Amju
{
class GSLoadLayers : public  GSText, public NonCopyable
{
private:
  GSLoadLayers();
  friend class Singleton<GSLoadLayers>;

public:
  virtual void OnActive();
  virtual void OnDeactive();
  virtual void Update();
  virtual void Draw2d();
  virtual void Draw();

private:
  int m_numLayersLoaded;
};

typedef Singleton<GSLoadLayers> TheGSLoadLayers;
}
