#include "Nicknames.h"

#include <ConfigFile.h>
#include <StringUtils.h>

#define NICK std::string("nick_")

namespace Amju
{
void SetNick(PlayerNum pn, const std::string& nick)
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  std::string key = NICK + ToString(static_cast<int>(pn));
  gcf->Set(key, nick);
}

std::string GetNick(PlayerNum pn)
{
  GameConfigFile* gcf = TheGameConfigFile::Instance();
  std::string key = NICK + ToString(static_cast<int>(pn));
  return gcf->GetValue(key);
}
}

