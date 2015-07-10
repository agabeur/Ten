//
//  SDUUserProfileViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 14/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDUFriendsListModel.h"

@interface SDUUserProfileViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SDUFriendsListModelProtocol>

@end
