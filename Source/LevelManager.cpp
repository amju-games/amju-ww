#include "LevelManager.h"
#include <Game.h>
#include "OnFloor.h"
#include <ResourceManager.h>
#include <StringUtils.h>
#include <GameObjectFactory.h>
#include <LoadVec3.h>
#include <StringUtils.h>
#include "WWGameObject.h"
#include "Player.h"
#include "PlayerInfo.h"

namespace Amju
{
LevelManager::LevelManager()
{
  m_levelId = 0;
  m_numObjects = 0;
  m_numPlayers = 0;
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
  return true;
}

bool LevelManager::Open(const std::string& filename)
{
  m_numPlayers = 0;
  Clear();
  m_file = new File;


  // TODO use current level number
  std::string levelFilename = filename;
  if (levelFilename.empty())
  {
    levelFilename = "levels/level-1.txt"; // TODO TEMP TEST
  }

  if (!m_file->OpenRead(levelFilename))
  {
    Assert(0);
    return false;
  }

  if (!m_file->GetInteger(&m_numObjects))
  {
    m_file->ReportError("Expected number of objects");
    return false;
  }

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
    static PlayerInfoManager* pim = ThePlayerInfoManager::Instance();
    m_numPlayers++;
    // If this is a one-player game, don't create player 2
    if (m_numPlayers > pim->GetNumPlayers())
    {
      std::cout << "Not creating player " << m_numPlayers << "\n";
      return true;
    }
    else
    {
      // Safe to add to scene graph
      p->AddSceneNode();
    }
  }

  TheGame::Instance()->AddGameObject(go);

std::cout << "Added game object " << go->GetTypeName() 
  << " ID: " << go->GetId() << "\n";

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
}
}
