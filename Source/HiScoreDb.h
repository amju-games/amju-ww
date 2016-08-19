#pragma once

#include <vector>
#include <File.h>
#include <Mutex.h>
#include <Singleton.h>
#include <Vec3.h>

namespace Amju
{
// Call at start of process to load, send req to server.
void HiScoreStartUp();
  
struct Hi
{
  Hi() : m_score(0), m_level(0), m_depth(0) {}
  Hi(int score, int level, int depth, const std::string& nick, const Vec3f& pos) : 
    m_score(score), m_level(level), m_depth(depth), m_nick(nick), m_pos(pos) {}

  bool operator<(const Hi& hi) const;
  
  bool Save(File* f) const;
  bool Load(File* f);
  
  int m_score;
  int m_level;
  int m_depth;
  std::string m_nick;
  Vec3f m_pos;
  
  // TODO More?
  // bool m_isLocal; //??
  //int m_sessionId; // ?
};
using HiScoreVec = std::vector<Hi>;

class HiScoreDb
{
public:
  HiScoreDb();

//  int GetNum() const;

protected:
  void GetTopN(int n, HiScoreVec* result) const;
  bool Load(std::string filename); // not const ref, changed in func
  bool Save(std::string filename);
  
  HiScoreVec m_hsVec;
};
  
class LocalHiScoreDb : public HiScoreDb
{
public:
  // Add score and sort table, does not save or send to server
  void AddHiScore(const Hi& hi);

  // Return true if score is within the top <n> scores.
  bool IsScoreTopN(int score, int n) const;

  bool Load();
  bool Save();
  
  // make protected member functions public
  using HiScoreDb::GetTopN;
  
private:
  bool SendToServer(const Hi& hi) const;
};

class GlobalHiScoreDb : public HiScoreDb
{
public:
  bool SendRequestToServer();
  void HandleResponseFromServer(const std::string& response);
  
  // Locked versions of member functions protected in base class
  void GetTopNLocked(int n, HiScoreVec* result) const;
  bool LoadLocked();
  bool SaveLocked();

private:
  mutable Mutex m_mutex;
};

typedef Singleton<LocalHiScoreDb> TheLocalHiScoreDb;
typedef Singleton<GlobalHiScoreDb> TheGlobalHiScoreDb;
}

