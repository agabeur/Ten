//
//  SDUFriendsListModel.m
//  Ten
//
//  Created by Stanislas Duthoit on 01/07/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUFriendsListModel.h"

@implementation SDUFriendsListModel

- (instancetype)init
{
    [FBRequestConnection startWithGraphPath:@"/me/friends"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                              NSDictionary *userData = (NSDictionary *)result;
                              self.FBFriends = [[NSMutableArray alloc] init];
                              
                              for (int i = 0; i < [[userData objectForKey:@"data"] count]; i++) {
                                  self.FBFriends[i] = [[[userData objectForKey:@"data"] objectAtIndex:i] objectForKey:@"name"];
                              }
                              [self didReceiveFBData];
                          }];
    return self;
}

-(void)didReceiveFBData
{
    [self.delegate FBDataDownloaded];

//    if (self.delegate) {
//        [self.delegate FBDataDownloaded];
//    }
}

@end
