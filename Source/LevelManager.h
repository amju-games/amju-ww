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

  // Level Blocks: each has Resource Group and Level File
  struct LevelBlock : public RefCounted
  {
    LevelBlock() : m_numObjects(0), m_currentObject(0) {}
    bool Open();
    int GetNumObjects() const { return m_numObjects; }
    bool LoadOneObject();
    bool AllLoaded() const { return m_currentObject == m_numObjects; }
    const Vec3f& GetTranslateForNext() const { return m_translateForNext; }

    std::string m_resGroup;
    std::string m_levelFilename;
    RCPtr<File> m_file;
    int m_numObjects; 
    int m_currentObject;
    int m_idBase; // Base object ID for objects in this block
    Vec3f m_translate; // translation for objects in this block, set from prev block
    Vec3f m_translateForNext; // translation for next block
  };
  typedef RCPtr<LevelBlock> PLevelBlock;
  typedef std::vector<PLevelBlock> Blocks;
  Blocks m_blocks;
  int m_currentBlock;

  // Map of Blocks, showing which Blocks can be joined to this one
  // use names, not ints, so we can have "hills", "ropebridge" etc as block names
  typedef std::vector<std::string> BlockNames; 
  typedef std::map<std::string, BlockNames> BlockMap;
  BlockMap m_followingBlocks;
};

typedef Singleton<LevelManager> TheLevelManager;
}

#endif
