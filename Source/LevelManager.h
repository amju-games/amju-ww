#ifndef LEVEL_MANAGER_H
#define LEVEL_MANAGER_H

#include <RCPtr.h>
#include <Singleton.h>
#include <map>
#include <vector>
#include <File.h>
#include <Vec3.h>

namespace Amju
{
class File;

class LevelManager : public NonCopyable
{
  LevelManager();
  friend class Singleton<LevelManager>;

public:
  void SetLevelId(int id);
  int GetLevelId() const;

  bool Open();
  bool LoadOneObject();
  int GetNumObjects();
  void Clear(); 

private:
  int m_levelId;
  int m_numObjects;
  RCPtr<File> m_file;
};

typedef Singleton<LevelManager> TheLevelManager;
}

#endif
