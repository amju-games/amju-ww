#include "LevelManager.h"
#include <Game.h>
#include "OnFloor.h"
#include <ResourceManager.h>
#include <StringUtils.h>
#include <GameObjectFactory.h>
#include <LoadVec3.h>
#include <StringUtils.h>
#include <Directory.h>
#include "WWGameObject.h"
#include "Player.h"
#include "Score.h"
#include "ShadowManager.h"
#include "GameMode.h"
#include "Describe.h"
#include "SaveDir.h"

namespace Amju
{
static int s_uniqueId = 0;

LevelManager::LevelManager()
{
  m_levelId = 0;
  m_numObjects = 0;
  m_numPlayers = 0;
  m_isOpen = false;
}

int LevelManager::GetUniqueId()
{
  return ++s_uniqueId;
}

bool LevelManager::SaveLevel(const std::string& filename)
{
  bool HAS_VERSION_INFO = true;
  bool NOT_BINARY = false;
  bool DONT_USE_ROOT = false;
  File::Impl impl = File::STD; // always - saving!

  File f(HAS_VERSION_INFO, impl);

  if (!f.OpenWrite(filename, File::CURRENT_VERSION, NOT_BINARY, DONT_USE_ROOT))
  {
    return false;
  }

  // Write Number of objects
  // For each object
  //  Write Typename
  //  Call Save on object
  //  Write "end"

  GameObjects* gos = TheGame::Instance()->GetGameObjects();

  f.WriteComment("// Num game objects");
  f.WriteInteger(gos->size());

  for (auto it = gos->begin(); it != gos->end(); ++it)
  {
    GameObject* go = it->second;

std::cout << "Saving: " << go->GetTypeName() << " ID: " << go->GetId() << "\n";

    WWGameObject* ww = dynamic_cast<WWGameObject*>(go);
    if (!ww)
    {
std::cout << " - Fail: Can't save this type of object.\n";
      return false;
    }

    f.WriteComment("");
    f.WriteComment("// Game object type");
    f.Write(go->GetTypeName());
    
    if (!ww->Save(&f))
    {
std::cout << " - Save Failed at object: " << go->GetTypeName() << " ID: " << go->GetId() << "\n";
      return false;
    }  
    f.Write("end");
  }
std::cout << "Save completed successfully?!\n";
  return true;
}

bool LevelManager::LoadEntireLevel(const std::string& filename)
{
  if (!Open(filename))
  {
    return false;
  }
  for (int i = 0; i < m_numObjects; i++)
  {
    if (!LoadOneObject())
    {
      return false;
    }
  }
  Close();
  return true;
}

void LevelManager::Close()
{
  m_file = 0;
  m_isOpen = false;
}

bool LevelManager::IsOpen() const
{
  return m_isOpen;
}

bool LevelManager::Open(const std::string& filename)
{
  Assert(!IsOpen());

  m_numPlayers = 0;
  Clear();

  // TODO use current level number
  std::string levelFilename = filename;
  bool HAS_VERSION_INFO = true;
  bool NOT_BINARY = false;
  bool useRoot = false;
  
  // On Mac and PC, level files are OS files so we can edit them
#if defined(WIN32) || defined(MACOSX)
  File::Impl impl = File::STD;
#else
  File::Impl impl = File::GLUE;
#endif

  if (levelFilename.empty())
  {
#if defined(WIN32) || defined(MACOSX)
    levelFilename = GetSaveDir();
#endif
    levelFilename += "levels/level-" + ToString(m_levelId) + ".txt"; 
    std::cout << "Level file: " << levelFilename << "\n";

    if (!FileExists(levelFilename))
    {
      std::cout << "Oh no! Level file does not exist! Using level 1...\n";
#if defined(WIN32) || defined(MACOSX)
      levelFilename = GetSaveDir();
#else
      levelFilename = "";
#endif
      levelFilename += "levels/level-1.txt";
    }

    // Never glue file -- level files are extracted to OS dir
//    impl = File::GLUE;
    useRoot = false;
  }

  m_file = new File(HAS_VERSION_INFO, impl);

  if (!m_file->OpenRead(levelFilename, NOT_BINARY, useRoot))
  {
    Assert(0);
    return false;
  }

  if (!m_file->GetInteger(&m_numObjects))
  {
    m_file->ReportError("Expected number of objects");
    return false;
  }

  m_isOpen = true;
  return true;
}

void LevelManager::SetLevelId(int id)
{
  m_levelId = id;
}

int LevelManager::GetLevelId() const
{
  return m_levelId;
}

bool LevelManager::LoadOneObject()
{
  Assert(IsOpen());

  std::string s;
  if (!m_file->GetDataLine(&s))
  {
    m_file->ReportError("Expected game object type");
    return false;
  }

  RCPtr<GameObject> go = TheGameObjectFactory::Instance()->Create(s);
  if (!go)
  {
    m_file->ReportError("Can't create game object: " + s);
    return false;
  }

  if (!go->Load(m_file))
  {
    m_file->ReportError("Failed to load game object: " + s);
    return false;
  }

  // Keep track of highest ID we have found 
  int id = go->GetId();
  if (id > s_uniqueId)
  {
    s_uniqueId = id;
  }
 
  // Check
  if (!m_file->GetDataLine(&s))
  {
    m_file->ReportError("Expected final line after game object");
    return false;
  }
  if (s != "end")
  {
    m_file->ReportError("Expected \"end\" here");
    return false;
  }

  Player* p = dynamic_cast<Player*>(go.GetPtr());
  if (p)
  {
    m_numPlayers++;
    // Only need to check in one-player game

    // If this is a one-player game, don't create player 2
    if (m_numPlayers > TheScores::Instance()->GetNumPlayers() &&
       !IsEditMode())
    {
      std::cout << "Not creating player " << m_numPlayers << "\n";
      return true;
    }
  }

  WWGameObject* ww = dynamic_cast<WWGameObject*>(go.GetPtr());
  Assert(ww);
  ww->AddToGame();

  if (p)
  {
    p->CreateController();
  }

#ifdef LM_DEBUG
std::cout << "Added game object " << Describe(go) << "\n";
#endif

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
  Close();
}
}
