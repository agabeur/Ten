//
//  SDULoginModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 13/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SDUFacebookData.h"

@protocol SDULoginModelProtocol <NSObject>

- (void)isAlreadyUser:(BOOL)isAlreadyUser;

@end

@interface SDULoginModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDULoginModelProtocol> delegate;

@property (nonatomic, weak) NSString *gender;
@property (nonatomic, weak) NSString *locale;
@property (nonatomic, weak) NSString *id;
@property (nonatomic, weak) NSString *updated_time;
@property (nonatomic, weak) NSString *last_name;
@property (nonatomic, weak) NSString *timezone;
@property (nonatomic, weak) NSString *email;
@property (nonatomic, weak) NSString *link;
@property (nonatomic, weak) NSString *verified;
@property (nonatomic, weak) NSString *name;
@property (nonatomic, weak) NSString *first_name;

- (void)uploadFBData:(FBGraphObject *)user;

@end
