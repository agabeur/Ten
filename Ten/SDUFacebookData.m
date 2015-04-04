//
//  SDUFacebookData.m
//  Ten
//
//  Created by Stanislas Duthoit on 12/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUFacebookData.h"

@implementation SDUFacebookData

@synthesize user = _user;

static SDUFacebookData *shared = NULL;

+ (SDUFacebookData *)sharedFacebookData
{
    @synchronized(shared)
    {
        if ( !shared || shared == NULL )
         {
         // allocate the shared instance, because it hasn't been done yet
         shared = [[SDUFacebookData alloc] init];
         }
        
        return shared;
    }
}

@end
