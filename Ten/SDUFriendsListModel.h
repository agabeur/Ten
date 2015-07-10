//
//  SDUFriendsListModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 01/07/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>

@protocol SDUFriendsListModelProtocol <NSObject>

- (void)FBDataDownloaded;

@end

@interface SDUFriendsListModel : NSObject

@property (nonatomic, weak) id<SDUFriendsListModelProtocol> delegate;
@property (strong, nonatomic) NSMutableArray *FBFriends;

- (void) didReceiveFBData;

@end
