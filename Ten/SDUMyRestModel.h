//
//  SDUMyRestModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 16/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDURest.h"
#import "SDUFacebookData.h"

@protocol SDUMyRestModelProtocol <NSObject>

- (void)restDownloaded:(NSArray *)items;

@end

@interface SDUMyRestModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDUMyRestModelProtocol> delegate;
@property (weak, nonatomic) FBGraphObject *user;

- (void)downloadMyRestaurants;
- (void)deleteRestaurant:(SDURest *)rest;

@end
