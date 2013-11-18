#ifndef GS_SHOW_LEVEL_H
#define GS_SHOW_LEVEL_H

#include "GSText.h"
#include "File.h"
#include "SceneNode.h"
#include <Singleton.h>

namespace Amju
{
class GSLoadLevel : public GSText, public NonCopyable
{
private:
  GSLoadLevel();
  friend class Singleton<GSLoadLevel>;

public:
  static const char* NAME;

  // GameState overrides
  virtual void OnActive();
  virtual void OnDeactive();
  virtual void Update();
  virtual void Draw2d();

private:
  void LoadOneObject();
  void StartLoad();

private:
  float m_maxBarX;

  int m_numObjects;
  int m_currentObj;
};

typedef Singleton<GSLoadLevel> TheGSLoadLevel;
}

#endif


