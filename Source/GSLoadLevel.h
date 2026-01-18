#ifndef GS_SHOW_LEVEL_H
#define GS_SHOW_LEVEL_H

#include "GSText.h"
#include "File.h"
#include "SceneNode.h"
#include <Singleton.h>

namespace Amju
{
enum GameMode { AMJU_MAIN_GAME_MODE, AMJU_ATTRACT_MODE, AMJU_EDIT_MODE };

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

  void SetGameMode(GameMode);
  GameMode GetGameMode() const { return m_mode; }

private:
  void LoadOneObject();
  void StartLoad();

private:
  float m_maxBarX;

  int m_numObjects;
  int m_currentObj;
  GameMode m_mode;
};

// Convenience function
void SetGameMode(GameMode);

typedef Singleton<GSLoadLevel> TheGSLoadLevel;
}

#endif


