#include <algorithm>
#include <sstream>
#include <File.h>
#include <LoadVec3.h>
#include <SafeUtils.h>
#include <StringUtils.h>
#include <UrlUtils.h>
#include <XML/XmlNodeInterface.h>
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
  // Load up local hi score table
  TheLocalHiScoreDb::Instance()->Load();
  
  // Load up global hi score table. We replace this if we get an updated table from the
  //  server, but if not, we can show the player the last table we got.
  TheGlobalHiScoreDb::Instance()->LoadLocked();
  
  // union global and local?? 
  
  // Send request for updated global hi scores
  TheGlobalHiScoreDb::Instance()->SendRequestToServer();
}
  
static const std::string SEP = " ";
static const std::string FILENAME_LOCAL = "local_hs.txt";
static const std::string FILENAME_GLOBAL = "global_hs.txt";
  
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

bool LocalHiScoreDb::Load()
{
  return HiScoreDb::Load(FILENAME_LOCAL);
}

bool LocalHiScoreDb::Save()
{
  return HiScoreDb::Save(FILENAME_LOCAL);
}

bool LocalHiScoreDb::IsScoreTopN(int score, int n) const
{
  if (n >= static_cast<int>(m_hsVec.size()))
  {
    return true;
  }
  int sc = m_hsVec[n].m_score;
  return score > sc;
}

void LocalHiScoreDb::AddHiScore(const Hi& hi)
{
  m_hsVec.push_back(hi);
  std::sort(m_hsVec.begin(), m_hsVec.end());
  Save();
}

void HiScoreDb::GetTopN(int n, HiScoreVec* result) const
{
  n = std::min(n, static_cast<int>(m_hsVec.size()));
  // Insert, not assign, so we can union the local and global tables if required
  result->insert(result->end(), m_hsVec.begin(), m_hsVec.begin() + n);
}

//int HiScoreDb::GetNum() const
//{
//  return static_cast<int>(m_hsVec.size());
//}

bool LocalHiScoreDb::SendToServer(const Hi& hi) const
{  
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
                    Hi hi(score, level, depth, nick, pos);
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
  
  MutexLocker lock(m_mutex);
  m_hsVec = vec;
  
  // Save locally so we can show something if we lose connectivity later
  HiScoreDb::Save(FILENAME_GLOBAL);
}

void GlobalHiScoreDb::GetTopNLocked(int n, HiScoreVec* result) const
{
  MutexLocker lock(m_mutex);
  HiScoreDb::GetTopN(n, result);
}

bool GlobalHiScoreDb::LoadLocked()
{
  MutexLocker lock(m_mutex);
  return HiScoreDb::Load(FILENAME_GLOBAL);
}

//bool GlobalHiScoreDb::SaveLocked()
//{
//  MutexLocker lock(m_mutex);
//  return HiScoreDb::Save(FILENAME_GLOBAL);
//}

}

