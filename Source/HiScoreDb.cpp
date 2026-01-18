#include <algorithm>
#include <sstream>
#include <AmjuHash.h>
#include <File.h>
#include <LoadVec3.h>
#include <SafeUtils.h>
#include <StringUtils.h>
#include <UrlUtils.h>
#ifdef MACOSX
#include <XmlNodeInterface.h>
#else
#include <XML/XmlNodeInterface.h>
#endif
#include "GameConsts.h"
#include "HiScoreDb.h"
#include "NetSend.h"
#include "SaveDir.h"

#ifdef min
#undef min
#endif

namespace Amju
{
void HiScoreStartUp()
{
  // Load up global hi score table. We update this if we get an updated table from the
  //  server, but if not, we can show the player the last table we got.
  TheGlobalHiScoreDb::Instance()->Load();
  
  // Send request for updated global hi scores
  TheGlobalHiScoreDb::Instance()->SendRequestToServer();
}
  
static const std::string FILENAME_LOCAL = "local_hs.txt";
static const std::string FILENAME_GLOBAL = "global_hs.txt";
  
static int MakeHash(const Hi& hi)
{
  std::string str = hi.m_nick + ToString(hi.m_depth) + ToString(hi.m_level) + ToString(hi.m_score);
  int hash = HashString(str);
  return hash;
}
  
bool Hi::operator<(const Hi& hi) const
{
  // Descending order by score
  return hi.m_score < m_score;
}
  
bool Hi::Save(File* f) const
{
  f->WriteInteger(m_score);
  f->WriteInteger(m_level);
  f->WriteInteger(m_depth);
  f->Write(EncodeStr(m_nick));
  SaveVec3(f, m_pos);
  return true;
}

bool Hi::Load(File* f)
{
  if (!f->GetInteger(&m_score))
  {
    return false;
  }

  if (!f->GetInteger(&m_level))
  {
    return false;
  }

  if (!f->GetInteger(&m_depth))
  {
    return false;
  }

  if (!f->GetDataLine(&m_nick))
  {
    return false;
  }
  m_nick = DecodeStr(m_nick);
  
  if (!LoadVec3(f, &m_pos))
  {
    return false;
  }

  return true;
}

HiScoreDb::HiScoreDb()
{
}

bool HiScoreDb::Load(std::string filename)
{
  // Load local hi score table
  m_hsVec.clear();
  filename = GetSaveDir() + filename;
  File f(false, File::STD);
  if (!f.OpenRead(filename, false, false))
  {
    f.ReportError("Failed to load hi scores!");
    return false;
  }
  int n = 0;
  if (!f.GetInteger(&n))
  {
    f.ReportError("Expected number of hi scores");
    return false;
  }
  for (int i = 0; i < n; i++)
  {
    Hi hi;
    if (!hi.Load(&f))
    {
      f.ReportError("Failed to load hi score line");
      return false;
    }
    int hash = MakeHash(hi);
    hi.m_hash = hash;
    m_hsVec.push_back(hi);
  }
  return true;
}

bool HiScoreDb::Save(std::string filename)
{
  filename = GetSaveDir() + filename;
  File f(false, File::STD);
  if (!f.OpenWrite(filename, 0, false, false, true))
  {
    f.ReportError("Failed to save hi scores!");
    return false;
  }
  f.WriteInteger(static_cast<int>(m_hsVec.size()));
  for (const auto& hi : m_hsVec)
  {
    hi.Save(&f);
  }
  return true;
}

bool HiScoreDb::IsScoreTopN(int score, int n) const
{
  if (n >= static_cast<int>(m_hsVec.size()))
  {
    return true;
  }
  int sc = m_hsVec[n].m_score;
  return score > sc;
}

void HiScoreDb::SetVec(const HiScoreVec& vec)
{
  m_hsVec = vec;
}

const HiScoreVec& HiScoreDb::GetVec() const
{
  return m_hsVec;
}

void HiScoreDb::AddHiScore(const Hi& chi)
{
  Hi hi(chi);
  int hash = MakeHash(hi);
  hi.m_hash = hash;
  m_hsVec.push_back(hi);
  std::sort(m_hsVec.begin(), m_hsVec.end());
}
  
void HiScoreDb::RemoveHiScore(const Hi& hi)
{
  if (!m_hsVec.empty())
  {
    int hash = MakeHash(hi);
    m_hsVec.erase(
      std::remove_if(m_hsVec.begin(), m_hsVec.end(), [=](const Hi& hi) { return hi.m_hash == hash; } ),
      m_hsVec.end());
  }
}

void HiScoreDb::GetTopN(int n, HiScoreVec* result) const
{
  n = std::min(n, static_cast<int>(m_hsVec.size()));
  // Insert, not assign, so we can union the local and global tables if required
  result->insert(result->end(), m_hsVec.begin(), m_hsVec.begin() + n);
}
  
void HiScoreDb::SendFirst()
{
  if (!m_hsVec.empty())
  {
    const Hi& hi = m_hsVec[0];
    NetSendHiScore(hi.m_nick, hi.m_score, hi.m_level, hi.m_depth, hi.m_pos);
  }
}

void GlobalHiScoreDb::AddHiScore(const Hi& hi)
{
  m_local.AddHiScore(hi);
  m_local.Save(FILENAME_LOCAL);
  
  // NetSendHiScore: here or at call site?
  // Send hi score to server
  NetSendHiScore(hi.m_nick, hi.m_score, hi.m_level, hi.m_depth, hi.m_pos);
  // -- response to this should be the latest global high scores, duh!
}
 
bool GlobalHiScoreDb::IsHiScore(int score) const
{
  // TODO Get union of global and local
  bool b = m_global.IsScoreTopN(score, HI_SCORE_TOP_N);
  return b;
}
  
int GlobalHiScoreDb::GetScorePos(int score) const
{
  HiScoreVec vec = m_global.GetVec();
  vec.insert(vec.end(), m_local.GetVec().begin(), m_local.GetVec().end());
  std::sort(vec.begin(), vec.end());
  
  int n = 0;
  for (auto& hi : vec)
  {
    if (score > hi.m_score)
    {
      return n;
    }
    n++;
  }
  return n;
}

void GlobalHiScoreDb::GetTopN(int n, HiScoreVec* result) const
{
  m_global.GetTopN(n, result);
  m_local.GetTopN(n, result);
  std::sort(result->begin(), result->end());
  if (result->size() > n)
  {
    // Too many rows, chop the extra from the bottom
    result->erase(result->begin() + n, result->end());
  }
}

bool GlobalHiScoreDb::Load()
{
  if (!m_global.Load(FILENAME_GLOBAL))
  {
    return false;
  }
  if (!m_local.Load(FILENAME_LOCAL))
  {
    return false;
  }
  return true;
}

bool GlobalHiScoreDb::SendRequestToServer()
{
  // Send request, add elements to this object when we get the response.
  return NetSendRequestHiScores();
}
  
void GlobalHiScoreDb::HandleResponseFromServer(const std::string& response)
{
  HiScoreVec vec;
  PXml xml = ParseXml(response.c_str());
  /*
   Example response:
   <hiscores>
     <hi>
       <score>200</score>
       <nick>Jay</nick>
       <level>2</level>
       <depth>3</depth>
       <pos>
         <x>12</x> <y>34</y> <z>56</z>
       </pos>
     </hi>
   </hiscores>
  */
  
  xml = xml.getChildNode("hiscores");
  if (!xml.isEmpty())
  {
    int n = xml.nChildNode();
    for (int i = 0; i < n; i++)
    {
      PXml xhi = xml.getChildNode(i);
      if (!xhi.isEmpty())
      {
        PXml xscore = xhi.getChildNode("score");
        if (!xscore.isEmpty())
        {
          int score = ToInt(xscore.getText());
          PXml xnick = xhi.getChildNode("nick");
          if (!xnick.isEmpty())
          {
            std::string nick = xnick.getText();
            PXml xlevel = xhi.getChildNode("level");
            if (!xlevel.isEmpty())
            {
              int level = ToInt(xlevel.getText());
              PXml xdepth = xhi.getChildNode("depth");
              if (!xdepth.isEmpty())
              {
                int depth = ToInt(xdepth.getText());
                PXml xpos = xhi.getChildNode("pos");
                if (!xpos.isEmpty())
                {
                  PXml xx = xpos.getChildNode("x");
                  PXml xy = xpos.getChildNode("y");
                  PXml xz = xpos.getChildNode("z");
                  if (!xx.isEmpty() && !xy.isEmpty() && !xz.isEmpty())
                  {
                    Vec3f pos(ToFloat(xx.getText()), ToFloat(xy.getText()), ToFloat(xz.getText()));
                    // Nickname is stored encoded in server DB
                    Hi hi(score, level, depth, DecodeStr(nick), pos);
                    vec.push_back(hi);
                    continue;
                  }
                }
              }
            }
          }
        }
      }
      std::cout << "ERROR (1) parsing hi scores XML from server!\n";
      return;
    }
  }
  else
  {
    std::cout << "ERROR (2) parsing hi scores XML from server!\n";
    return;
  }
  
  m_global.SetVec(vec);
  
  // Save locally so we can show something if we lose connectivity later
  m_global.Save(FILENAME_GLOBAL);
  
  // Remove local hi scores which are in the response
  for (const Hi& hi : vec)
  {
    m_local.RemoveHiScore(hi);
  }
  
  m_local.Save(FILENAME_LOCAL);
  
  // Send any remaining local hi scores to the server. We send the scores one at a time.
  //  Each successful addition will come back to this function.
  m_local.SendFirst();
}

}

