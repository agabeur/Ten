//
//  SDUBarListAnnotation.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarListAnnotation.h"

@implementation SDUBarListAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize bar = _bar;

- (id)initWithBar:(SDUBar *)bar
{
    if ((self = [super init])) {
        self.bar = bar;
        self.title = bar.name;
        self.subtitle = [NSString stringWithFormat:@"%d",bar.relevance];
        self.coordinate = bar.coordinates;
    }
    return self;
}


@end
