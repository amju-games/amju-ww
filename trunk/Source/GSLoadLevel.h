#ifndef GS_SHOW_LEVEL_H
#define GS_SHOW_LEVEL_H

#include "GSText.h"
#include "File.h"
#include "SceneNode.h"

namespace Amju
{
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

private:
  void LoadOneObject();
  void StartLoad();

private:
  std::string m_level;
  float m_timer;
  float m_maxBarX;

  int m_numObjects;
  int m_currentObj;
  RCPtr<File> m_file;
  PSceneNode m_pRoot;
};
}

#endif


