#ifdef AMJU_IOS

#include <iostream>
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import <Twitter/TWRequest.h>
#include <Mutex.h>
#include "iOSTweet.h"

// http://stackoverflow.com/questions/14192003/sending-tweet-without-twtweetcomposeviewcontroller

namespace Amju
{
  static std::vector<std::string> s_accountNames;
  static Mutex s_accountNameMutex; // TODO No need to lock if we wait for TwitterOK..
  static bool s_twitterOk = false;
  static ACAccountStore* accountStore = nil;
  static ACAccountType* accountType = nil;
  static NSArray* accountsArray = nil;
  
  bool TwitterInit()
  {
    // Get the account names
    accountStore = [[ACAccountStore alloc] init];
    accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
    {
      if (granted)
      {
        accountsArray = [accountStore accountsWithAccountType:accountType];
        int numAccs = [accountsArray count];
        if (numAccs > 0)
        {
          // Store the account names
          MutexLocker lock(s_accountNameMutex);
          for (int i = 0; i < numAccs; i++)
          {
            std::string s = [[[accountsArray objectAtIndex:i] accountDescription] UTF8String];
            s_accountNames.push_back(s);
          }
          s_twitterOk = true;
        }
      }
    }];
    return true;
  }
  
  bool TwitterIsOk()
  {
    return s_twitterOk;
  }
  
  bool TwitterGetAccounts(std::vector<std::string>* accountNames)
  {
    MutexLocker lock(s_accountNameMutex); // No need to lock if we wait until TwitterIsOk
    *accountNames = s_accountNames;
    return s_twitterOk;
  }
  
  bool TwitterPostMessage(int account, const std::string& messageStr)
  {
    if (!s_twitterOk)
    {
      std::cout << "TwitterPostMessage failed, Twitter not OK\n";
      return false;
    }
    
    // TODO TEMP TEST - get the accounts again
    NSArray *accountsArr = [accountStore accountsWithAccountType:accountType];
    if ([accountsArr count] > account)
    {
      // choose account


      ACAccount *twitterAccount = [accountsArr objectAtIndex:account];
      
      // Create message dictionary
      NSDictionary* message = @{ @"status": [[NSString alloc] initWithUTF8String:messageStr.c_str()] };
      
      NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/update.json"];
      
      SLRequest *postRequest = [SLRequest
                                requestForServiceType:SLServiceTypeTwitter
                                requestMethod:SLRequestMethodPOST
                                URL:requestURL
                                parameters:message];
      
      [postRequest setAccount:twitterAccount];
      
      [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
      {
        //show status after done
        NSString *output = [NSString stringWithFormat:@"HTTP response status: %i", [urlResponse statusCode]];
        NSLog(@"Twitter post status : %@", output);
      }];
      return true;
    }
    else
    {
      std::cout << "Tweet failed, account out of range. Num accounts is " << [accountsArr count] << ", account requested: " << account << "\n";
      return false;
    }
  }
  
  bool TwitterPostMessageWithImage(const std::string& account, const std::string& message, const std::string* imagePathAndFilename);
}


//- (void)shareTwitterImage:(UIImage *)image
void ShareTwitterImage()
{
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];

    NSDictionary* myOptions = nil;
    [accountStore requestAccessToAccountsWithType:accountType options:myOptions completion:^(BOOL granted, NSError *error)
    {
        if(granted)
        {
             NSArray *accountsArray = [accountStore accountsWithAccountType:accountType];

             if ([accountsArray count] > 0)
             {
                 // TODO How to choose which account?
                 ACAccount *twitterAccount = [accountsArray objectAtIndex:2];

                 NSDictionary* message = @{@"status": @"A Twitter post"};
               
                 NSURL *requestURL = [NSURL
                                    URLWithString:@"https://api.twitter.com/1/statuses/update.json"];

                 //NSURL *uploadURL = [NSURL URLWithString:@"https://upload.twitter.com/1/statuses/update_with_media.json"];

                 SLRequest *postRequest = [SLRequest
                                           requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodPOST
                                           URL:requestURL
                                           parameters:message];
               
                 // TODO Post a screenshot
                 // UIImage* image = ...; // TODO - get from .png file saved previously
                 // [postRequest addMultiPartData:UIImagePNGRepresentation(image) withName:@"media" type:@"multipart/png"];
               
                 [postRequest setAccount:twitterAccount];
               
                 [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      //show status after done
                      NSString *output = [NSString stringWithFormat:@"HTTP response status: %i", [urlResponse statusCode]];
                      NSLog(@"Twitter post status : %@", output);
                  }];
             }
         }
     }];
}

#endif // AMJU_IOS

