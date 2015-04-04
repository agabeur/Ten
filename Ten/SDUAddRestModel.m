//
//  SDUAddRestModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 10/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUAddRestModel.h"
#import "NSString+NSString_extended.h"

@interface SDUAddRestModel()
{
    NSMutableData *_downloadedData;
}

@end

@implementation SDUAddRestModel

@synthesize name = _name;
@synthesize address = _address;
@synthesize longitude = _longitude;
@synthesize latitude = _latitude;
@synthesize restid = _restid;
@synthesize userid = _userid;
@synthesize moodid = _moodid;

- (void)addRest:(SDURest *)rest
{
    
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    
    self.name = [rest.name urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.address = [rest.address urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.latitude = [[NSString stringWithFormat: @"%f", rest.coordinates.latitude] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.longitude = [[NSString stringWithFormat: @"%f", rest.coordinates.longitude] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.restid = [rest.factual_id urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.userid = [[self.user objectForKey:@"id"] urlEncodeUsingEncoding:NSUTF8StringEncoding];

    NSString *options = [[[[[[[[[[[[[[@"?" stringByAppendingString:@"name="] stringByAppendingString:self.name] stringByAppendingString:@"&address="] stringByAppendingString:self.address] stringByAppendingString:@"&restid="] stringByAppendingString:self.restid] stringByAppendingString:@"&latitude="] stringByAppendingString:self.latitude] stringByAppendingString:@"&longitude="] stringByAppendingString:self.longitude] stringByAppendingString:@"&userid="] stringByAppendingString:self.userid] stringByAppendingString:@"&moodid="] stringByAppendingString:self.moodid];
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:[@"http://localhost/add-rest.php" stringByAppendingString:options]];
    
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
       // [self.delegate isAlreadyUser:_isAlreadyUser];
    }
}

@end
