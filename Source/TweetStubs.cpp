#include "iOSTweet.h"

namespace Amju
{
bool TwitterIsOk()
{
  return false;
}
  
bool TwitterInit()
{
  return false;
}

bool TwitterGetAccounts(std::vector<std::string>* accountNames)
{
  return false;
}

bool TwitterPostMessage(int account, const std::string& message)
{
  return false;
}

bool TwitterPostMessageWithImage(int account, const std::string& message, const std::string* imagePathAndFilename)
{
  return false;
}
}

