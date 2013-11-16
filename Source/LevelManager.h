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

  bool Open(const std::string& filename = "");
  void Close();

  // Returns true if between Open and Close calls -- don't Open if already
  //  open!
  bool IsOpen() const;

  bool LoadOneObject();
  int GetNumObjects();
  void Clear(); 

  // Edit mode - just load everything
  bool LoadEntireLevel(const std::string& filename);

private:
  int m_levelId;
  int m_numObjects;
  RCPtr<File> m_file;
  int m_numPlayers; // keep track of how many players created
  bool m_isOpen;
};

typedef Singleton<LevelManager> TheLevelManager;
}

#endif
