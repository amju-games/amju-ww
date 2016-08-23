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
    m_score(score), m_level(level), m_depth(depth), m_nick(nick), m_pos(pos), m_hash(0) {}

  bool operator<(const Hi& hi) const;
  
  bool Save(File* f) const;
  bool Load(File* f);
  
  int m_score;
  int m_level;
  int m_depth;
  std::string m_nick;
  Vec3f m_pos;
  int m_hash;
};
  
using HiScoreVec = std::vector<Hi>;

class HiScoreDb
{
public:
  HiScoreDb();

  void GetTopN(int n, HiScoreVec* result) const;

  // Return true if score is within the top <n> scores.
  bool IsScoreTopN(int score, int n) const;
  
  void SetVec(const HiScoreVec& vec);
  void AddHiScore(const Hi& hi);
  void RemoveHiScore(const Hi& hi);
  
  bool Load(std::string filename); // not const ref, changed in func
  bool Save(std::string filename);

  // If non empty, send the first hi score to the server.
  // This is sp we send outstanding local hi scores when we regain connectivity.
  void SendFirst();
  
private:
  HiScoreVec m_hsVec;
};
  
class GlobalHiScoreDb
{
public:
  // Send request to get hi scores from the server. This list will not include scores added
  //  locally more recently.
  bool SendRequestToServer();
  
  // Parse response hi score table (XML) from server
  void HandleResponseFromServer(const std::string& response);

  // Add score achieved on local client. Send to server. Add to results until we know it was
  //  successfully recvd at the server.
  void AddHiScore(const Hi& hi);
  
  // Load cached hi score table and outstanding local hi scores. Called at start of process.
  bool Load();
  
  // Save cached table, and local hi scores (global and local are saved to separate files)
  bool Save();

  // Return the results cached from server, with any local scores added.
  void GetTopN(int n, HiScoreVec* result) const;
  
  // Ret true if score is high enough to be added
  bool IsHiScore(int score) const;

private:
  HiScoreDb m_global; // cache of server, may not contain all local hi scores
  HiScoreDb m_local; // temporary store of recent local hi scores not yet in global table
};

typedef Singleton<GlobalHiScoreDb> TheGlobalHiScoreDb;
}

