//
//  SDUItem.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItem.h"

@implementation SDUItem

@synthesize name = _name;
@synthesize address = _address;
@synthesize coordinates = _coordinates;
@synthesize relevance = _relevance;
@synthesize factual_id = _factual_id;

- (id)initWithName:(NSString *)name address:(NSString *)address coordinates:(CLLocationCoordinate2D)coordinates relevance:(int)relevance{
    self = [super init];
    if (self) {
        self.name = name;
        self.address = address;
        self.coordinates = coordinates;
        self.relevance = relevance;
    }
    
    return self;
}

@end