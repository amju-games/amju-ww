#include "PlayerInfo.h"
#include "StringUtils.h"
#include "File.h"

namespace Amju
{
const std::string& PlayerInfo::GetString(int key) const
{
  Map::const_iterator it = m_map.find(key);
  Assert(it != m_map.end());
  return it->second;
}

int PlayerInfo::GetInt(int key) const
{
  return ToInt(GetString(key));
}

float PlayerInfo::GetFloat(int key) const
{
  return ToFloat(GetString(key));
}

void PlayerInfo::Set(int key, const std::string& value)
{
  m_map[key] = value;
}

void PlayerInfo::Set(int key, int value)
{
  m_map[key] = ToString(value);
}

void PlayerInfo::Set(int key, float value)
{
  m_map[key] = ToString(value);
}

bool PlayerInfo::Load(File*)
{
  return true;
}

bool PlayerInfo::Save(File*)
{
  return true;
}

void PlayerInfoManager::Init(int numPlayers)
{
  m_piv.clear();
  for (int i = 0; i < numPlayers; i++)
  {
    m_piv.push_back(new PlayerInfo);
  }
}

int PlayerInfoManager::GetNumPlayers() const
{
  return m_piv.size();
}

PlayerInfo* PlayerInfoManager::GetPlayerInfo(int player)
{
  Assert(player < (int)m_piv.size());
  return m_piv[player];
}
}
