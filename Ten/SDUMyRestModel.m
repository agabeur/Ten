//
//  SDUMyRestModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUMyRestModel.h"

@interface SDUMyRestModel()
{
    NSMutableData *_downloadedData;
    BOOL _didDownloadMyRestaurants;
}

@end

@implementation SDUMyRestModel

- (void)downloadMyRestaurants
{
    _didDownloadMyRestaurants = true;
    
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:[@"http://localhost/my-rest.php?userid=" stringByAppendingString:[self.user objectForKey:@"id" ]]];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

- (void)deleteRestaurant:(SDURest *)rest
{
    _didDownloadMyRestaurants = false;
    
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    NSString *factual_id = rest.factual_id;
    NSString *userid = [self.user objectForKeyedSubscript:@"id"];
    NSURL *jsonFileUrl = [NSURL URLWithString:[[[@"http://localhost/delete-my-rest.php?factual_id=" stringByAppendingString:rest.factual_id] stringByAppendingString:@"&userid="] stringByAppendingString:[self.user objectForKeyedSubscript:@"id"]]];
    
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
    // Creat the restaurants array only if the dowmnloadMyRestaurants method has been used
    if (_didDownloadMyRestaurants) {
    
        // Create an array to store the locations
        NSMutableArray *_restaurants = [[NSMutableArray alloc] init];
    
        // Parse the JSON that came in
        NSError *error;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
        // Loop through Json objects, create question objects and add them to our questions array
        for (int i = 0; i < jsonArray.count; i++)
        {
            NSDictionary *jsonElement = jsonArray[i];
        
            // Create a new location object and set its props to JsonElement properties
            SDURest *newRest = [[SDURest alloc] init];
            newRest.name = jsonElement[@"name"];
            newRest.address = jsonElement[@"address"];
            CLLocationCoordinate2D coordinates;
            coordinates.latitude = [jsonElement[@"latitude"] doubleValue];
            coordinates.longitude = [jsonElement[@"longitude"] doubleValue];
            newRest.coordinates = coordinates;
            newRest.relevance = (int) jsonElement[@"longitude"];
            newRest.factual_id = jsonElement[@"restid"];
            // Add this question to the locations array
            [_restaurants addObject:newRest];
        }
    
        // Ready to notify delegate that data is ready and pass back items
        if (self.delegate)
        {
            [self.delegate restDownloaded:_restaurants];
        }
    }
}

@end