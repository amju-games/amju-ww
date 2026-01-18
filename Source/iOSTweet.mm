// Send a tweet - in this case we want to send a message and part of a screenshot.
// From:
// http://stackoverflow.com/questions/14192003/sending-tweet-without-twtweetcomposeviewcontroller

#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import <Twitter/TWRequest.h>

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

