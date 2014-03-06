//
//  SDURestListAnnotation.m
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDURestListAnnotation.h"

@implementation SDURestListAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize rest = _rest;

- (id)initWithRest:(SDURest *)rest
{
    if ((self = [super init])) {
        self.rest = rest;
        self.title = rest.name;
        self.subtitle = [NSString stringWithFormat:@"%d",rest.relevance];
        self.coordinate = rest.coordinates;
    }
    return self;
}

@end
