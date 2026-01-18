#pragma once

#include <vector>
#include <string>

namespace Amju
{
// Send tweets - in this game we want to post messages and optionally part of a screenshot.
 
// Call after TwitterInit() to check if we can tweet.
bool TwitterIsOk();
  
// Call once first
bool TwitterInit();

bool TwitterGetAccounts(std::vector<std::string>* accountNames);

bool TwitterPostMessage(int account, const std::string& message);

bool TwitterPostMessageWithImage(int account, const std::string& message, const std::string* imagePathAndFilename);
}
