//
//  SDUMyFriendsTableViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 10/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "SDUFriend.h"

@interface SDUMyFriendsTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *myFriends;

@property (nonatomic, strong) NSArray *searchResults;

- (IBAction)showMenu:(id)sender;

@end
