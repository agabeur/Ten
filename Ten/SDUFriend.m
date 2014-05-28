//
//  SDUFriend.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUFriend.h"

@implementation SDUFriend

@synthesize name = _name;

@synthesize restList = _restList;

@synthesize barList = _barList;

- (id) initWithName:(NSString*) name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

@end
