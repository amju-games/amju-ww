#ifndef PLAYER_INFO_H
#define PLAYER_INFO_H

#include <map>
#include <string>
#include "RCPtr.h"
#include "Singleton.h"

namespace Amju
{
class File;

class PlayerInfo : public RefCounted
{
public:
  const std::string& GetString(int key) const;
  int GetInt(int key) const;
  float GetFloat(int key) const;

  void Set(int key, const std::string& value);
  void Set(int key, int value);
  void Set(int key, float value);

  bool Load(File*);
  bool Save(File*);

private:
  typedef std::map<int, std::string> Map;
  Map m_map;
};

typedef RCPtr<PlayerInfo> PPInfo;

class PlayerInfoManager : public NonCopyable
{
private:
  PlayerInfoManager() {}
  friend class Singleton<PlayerInfoManager>;

public:
  void Init(int numPlayers);
  int GetNumPlayers() const;
  PlayerInfo* GetPlayerInfo(int player);

private:
  typedef std::vector<PPInfo> PIV;
  PIV m_piv;
};

typedef Singleton<PlayerInfoManager> ThePlayerInfoManager;
}

#endif
