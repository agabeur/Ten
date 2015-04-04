//
//  SDUMapListModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItemMapListModel.h"

@interface SDUItemMapListModel()
{
    NSMutableData *_downloadedData;
}

@end

@implementation SDUItemMapListModel

- (void)downloadItems:(NSString *)mood
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:[@"http://localhost/service.php?mood=" stringByAppendingString:mood]];
    
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
    // Create an array to store the locations
    NSMutableArray *_items = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        SDUItem *newItem = [[SDUItem alloc] init];
        newItem.name = jsonElement[@"name"];
        newItem.address = jsonElement[@"address"];
        CLLocationCoordinate2D coordinates;
        coordinates.latitude = [jsonElement[@"latitude"] doubleValue];
        coordinates.longitude = [jsonElement[@"longitude"] doubleValue];
        newItem.coordinates = coordinates;
        newItem.relevance = (int) jsonElement[@"longitude"];
        // Add this question to the locations array
        [_items addObject:newItem];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemDownloaded:_items];
    }
}

@end