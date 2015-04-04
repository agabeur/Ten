//
//  SDUFacebookData.h
//  Ten
//
//  Created by Stanislas Duthoit on 12/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SDUFacebookData : NSObject{
    FBGraphObject *user;
}

@property (retain, nonatomic) FBGraphObject *user;

+ (SDUFacebookData *)sharedFacebookData;

@end
