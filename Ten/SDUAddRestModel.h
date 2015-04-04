//
//  SDUAddRestModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 10/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDURest.h"
#import "SDUFacebookData.h"

@protocol SDUAddRestModelProtocol <NSObject>

//- (void)restDownloaded:(NSArray *)items;

@end

@interface SDUAddRestModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDUAddRestModelProtocol> delegate;
@property (weak, nonatomic) FBGraphObject *user;
@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *address;
@property (weak, nonatomic) NSString *longitude;
@property (weak, nonatomic) NSString *latitude;
@property (weak, nonatomic) NSString *restid;
@property (weak, nonatomic) NSString *userid;
@property (nonatomic, weak) NSString *moodid;

- (void)addRest:(SDURest *)rest;

@end
