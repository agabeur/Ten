//
//  SDUScreenSizes.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUScreenSizes.h"

@implementation SDUScreenSizes

@synthesize screenWidth;
@synthesize screenHeight;
@synthesize navigationBarHeight;

+(SDUScreenSizes*)sharedManager
{
    static SDUScreenSizes *sharedManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedManager = [[SDUScreenSizes alloc] init];
    });
    return sharedManager;
}

@end
