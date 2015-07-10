//
//  SDULoginModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDULoginModel.h"
#import "NSString+NSString_extended.h"

@interface SDULoginModel()
{
    NSMutableData *_downloadedData;
}

@end

@implementation SDULoginModel

@synthesize gender = _gender;
@synthesize locale = _locale;
@synthesize id = _id;
@synthesize updated_time = _updated_time;
@synthesize last_name = _last_name;
@synthesize timezone = _timezone;
@synthesize email = _email;
@synthesize link = _link;
@synthesize verified = _verified;
@synthesize name = _name;
@synthesize first_name = _first_name;

- (void)uploadFBData:(FBGraphObject *)user
{
    //SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];

    self.gender = [[user objectForKey:@"gender"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.locale = [[user objectForKey:@"locale"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.id = [[user objectForKey:@"id"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.updated_time = [[user objectForKey:@"updated_time"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.last_name = [[user objectForKey:@"last_name"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.timezone = [[[user objectForKey:@"timezone"] stringValue] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.email = [[user objectForKey:@"email"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.link = [[user objectForKey:@"link"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
    if ([user objectForKey:@"verified"]) {
        self.verified = @"1";
    } else {
        self.verified = @"0";
    }
    self.name = [[user objectForKey:@"name"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.first_name = [[user objectForKey:@"first_name"] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
    NSString *options = [[[[[[[[[[[[[[[[[[[[[[@"?" stringByAppendingString:@"gender="]stringByAppendingString:self.gender] stringByAppendingString:@"&locale="]stringByAppendingString:self.locale] stringByAppendingString:@"&id="]stringByAppendingString:self.id] stringByAppendingString:@"&updated_time="]stringByAppendingString:self.updated_time] stringByAppendingString:@"&last_name="]stringByAppendingString:self.last_name] stringByAppendingString:@"&timezone="]stringByAppendingString:self.timezone] stringByAppendingString:@"&email="]stringByAppendingString:self.email] stringByAppendingString:@"&link="]stringByAppendingString:self.link] stringByAppendingString:@"&verified="]stringByAppendingString:self.verified] stringByAppendingString:@"&name="]stringByAppendingString:self.name] stringByAppendingString:@"&first_name="]stringByAppendingString:self.first_name];
    NSLog(@"%@", options);
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:[@"http://localhost/check-user.php" stringByAppendingString:options]];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create a bool to store user status
    BOOL _isAlreadyUser = NULL;
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    NSDictionary *jsonElement = jsonArray[0];
    
    _isAlreadyUser = jsonElement[@"is_already_user"];
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
//        [self.delegate isAlreadyUser:_isAlreadyUser];
    }
}

@end
