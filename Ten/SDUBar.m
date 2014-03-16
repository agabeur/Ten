//
//  SDUBar.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUBar.h"

@implementation SDUBar

@synthesize name = _name;

@synthesize address = _address;

@synthesize coordinates = _coordinates;

@synthesize relevance = _relevance;

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
