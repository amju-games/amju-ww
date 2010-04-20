#ifndef GS_SHOW_LEVEL_H
#define GS_SHOW_LEVEL_H

#include "GSText.h"
#include "File.h"
#include "SceneNode.h"

namespace Amju
{
enum GameMode { AMJU_MAIN_GAME_MODE, AMJU_ATTRACT_MODE, AMJU_EDIT_MODE };

class GSLoadLevel : public GSText
{
public:
  static const char* NAME;

  GSLoadLevel();

  // GameState overrides
  virtual void OnActive();
  virtual void OnDeactive();
  virtual void Update();

  void SetLevel(const std::string& level);
  const std::string& GetLevel() const;

  void SetGameMode(GameMode);

private:
  void LoadOneObject();
  void StartLoad();

private:
  std::string m_level;
  float m_maxBarX;

  int m_numObjects;
  int m_currentObj;
  RCPtr<File> m_file;
  GameMode m_mode;
};

// Convenience functions
void SetLevel(const std::string& levelName);
void SetGameMode(GameMode);

}

#endif


