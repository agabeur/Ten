//
//  SDUAddRestModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 09/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUSearchRestModel.h"
#import "NSString+NSString_extended.h"

@interface SDUSearchRestModel()
{
    NSMutableData *_downloadedData;
}

@end

@implementation SDUSearchRestModel

@synthesize locationManager = _locationManager;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (void)downloadItems:(NSString *)searchString
{
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    
    self.latitude = [[NSString stringWithFormat: @"%f", self.locationManager.location.coordinate.latitude] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    self.longitude = [[NSString stringWithFormat: @"%f", self.locationManager.location.coordinate.longitude] urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
    NSString *options = [[[[[@"?q=" stringByAppendingString:searchString]  stringByAppendingString:@"&latitude=" ] stringByAppendingString:self.latitude] stringByAppendingString:@"&longitude="] stringByAppendingString:self.longitude];
    
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:[@"http://localhost/rest-search.php" stringByAppendingString:options]];
    
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
        newRest.factual_id = jsonElement[@"factual_id"];
        // Add this question to the locations array
        [_restaurants addObject:newRest];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate restSearchDownloaded:_restaurants];
    }
}

@end
