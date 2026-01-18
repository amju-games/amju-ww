#include "LevelManager.h"
#include <Game.h>
#include "OnFloor.h"
#include <ResourceManager.h>
#include <StringUtils.h>
#include <GameObjectFactory.h>
#include <LoadVec3.h>
#include <StringUtils.h>
#include "WWGameObject.h"

#define REPORT_BLOCKS

namespace Amju
{
bool LevelManager::LevelBlock::Open()
{
  TheResourceManager::Instance()->LoadResourceGroup(m_resGroup);

  m_file = new File;
  if (!m_file->OpenRead(m_levelFilename))
  {
    Assert(0);
    return false;
  }

  m_file->GetInteger(&m_numObjects);
  m_currentObject = 0;

  // Read translation for next block
  LoadVec3(m_file, &m_translateForNext);

  return true;
}

LevelManager::LevelManager()
{
  m_levelId = 0;
  m_numObjects = 0;
  m_currentBlock = 0;

  // Load block table: for each block ID, a list of the blocks which may
  //  be concatenated.
  File f;
  if (!f.OpenRead("levels/block-table.txt"))
  {
    f.ReportError("No level block table");
    Assert(0);
  }

  int numBlocks = 0;
  if (!f.GetInteger(&numBlocks))
  {
    f.ReportError("Expected number of blocks");
    Assert(0);
  }
  for (int i = 0; i < numBlocks; i++)
  {
    // Get ID of block
    std::string blockId;
    f.GetDataLine(&blockId);
    BlockNames& blockNames = m_followingBlocks[blockId];

    // Comma-separated list of IDs which may follow 
    std::string s;
    f.GetDataLine(&s);
    Strings strs = Split(s, ',');
    for (unsigned int i = 0; i < strs.size(); i++)
    {
      blockNames.push_back(strs[i]);
    }
  }
}

void LevelManager::SetLevelId(int id)
{
  m_levelId = id;
}

int LevelManager::GetLevelId() const
{
  return m_levelId;
}

bool LevelManager::Open()
{
  Clear();

  // Procedurally creating level:
  // Level is made up of Blocks. The first Block is chosen based on Level ID.
  // Each Block has Game Objects, and Level Workers which create Game Objects.
  // Also each Block has a list of other Blocks which can be joined to this one.
  // One of these Blocks (or none ?) is chosen, again using Level ID.
  // Each Block has its own Resource Group, all of which should be trashed
  // when the level is completed.

  // TODO TEMP TEST
  // Decide on first block. Should be random, but depending on level ID too..?
  //int blockId = 1; // TODO m_levelId % 10; // so first block changes every 10 level IDs
  std::string blockId = "1";

  int numBlocks = 0;

#ifdef REPORT_BLOCKS
  BlockNames allIds; // just for reporting
#endif

  while (true)
  {
#ifdef REPORT_BLOCKS
    allIds.push_back(blockId);
#endif

    // Keep adding  blocks
    std::string strLevel = blockId;

    std::string groupname = "levels/block-" + strLevel + "-group";
    std::string levelfilename = "levels/block-" + strLevel + ".txt";

    LevelBlock* lb = new LevelBlock;
    lb->m_levelFilename = levelfilename;
    lb->m_resGroup = groupname;
    lb->m_idBase = numBlocks * 1000;
    m_blocks.push_back(lb);

    numBlocks++;

    // Absolute max number of blocks, make sure this terminates
    if (numBlocks > 10) // TODO
    {
      break;
    }

    // Find the block number which should follow, or stop if no more blocks
    // Get vec of all permissible blocks
    BlockNames& blockNames = m_followingBlocks[blockId]; 
    Assert(!blockNames.empty());
    // Choose one - random and using level ID
    int r = (m_levelId + rand()) % blockNames.size();
    blockId = blockNames[r]; // ID of next block
    if (blockId == "end")
    {
      // This means no block follows
      break;
    }
  }

#ifdef REPORT_BLOCKS
  std::cout << "Level " << m_levelId << " comprised of these blocks: ";
  for (unsigned int i = 0; i < allIds.size(); i++)
  {
    std::cout << allIds[i] << " ";
  }
  std::cout << "\n";
#endif // REPORT_BLOCKS

  // Open up all the blocks, to find how many objects are in this level
  m_numObjects = 0;
  Vec3f translate;
  for (unsigned int i = 0; i < m_blocks.size(); i++)
  {
    LevelBlock* lb = m_blocks[i];
    lb->Open(); // TODO Check OK
    m_numObjects += lb->GetNumObjects();
    lb->m_translate = translate;
    translate = lb->GetTranslateForNext();
  }
  m_currentBlock = 0;

  return true;
}

bool LevelManager::LoadOneObject()
{
  // Read from current block
  Assert(!m_blocks.empty());
  Assert((unsigned int)m_currentBlock < m_blocks.size());

  LevelBlock* lb = m_blocks[m_currentBlock];
  if (!lb->LoadOneObject())
  {
    return false;
  }
  // When all data loaded from this block, go to next
  if (lb->AllLoaded())
  {
    lb->m_file = 0; // Close file
    m_currentBlock++;
    if (m_currentBlock == (int)m_blocks.size())
    {
      // No more - trash all blocks
      m_blocks.clear();
    }
  }
  return true;
}

bool LevelManager::LevelBlock::LoadOneObject()
{
  std::string s;
  m_file->GetDataLine(&s);
  PGameObject pgo = TheGameObjectFactory::Instance()->Create(s);
  Assert(pgo);

  // Translate object - so blocks are offset, can be repeated, can be
  //  different sizes, etc.
  // TODO Rotation too
  Matrix mat;
  mat.Translate(m_translate);
  Assert(dynamic_cast<WWGameObject*>(pgo.GetPtr()));
  ((WWGameObject*)pgo.GetPtr())->SetTransform(mat);

  if (!pgo->Load(m_file))
  {
    m_file->ReportError("Error loading object; type:" + s);
    Assert(0);
  }

  std::string end;
  if (!m_file->GetDataLine(&end) || end != "end")
  {
    m_file->ReportError("Expected \"end\" after object; type: " + s);
    Assert(0);
  }

  // Add offset to Game Object ID so blocks can be repeated etc
  pgo->SetId(pgo->GetId() + m_idBase);

  TheGame::Instance()->AddGameObject(pgo);

  m_currentObject++;

  return true;
}

int LevelManager::GetNumObjects()
{
  return m_numObjects;
}

void LevelManager::Clear()
{
  // Clear game objects
  TheGame::Instance()->ClearGameObjects();
  OnFloor::ClearFloors();

  // Trash resource groups
  for (unsigned int i = 0; i < m_blocks.size(); i++)
  {
    TheResourceManager::Instance()->FreeResourceGroup(m_blocks[i]->m_resGroup);
  }
}
}
