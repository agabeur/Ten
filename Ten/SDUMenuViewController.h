//
//  SDUMenuViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 13/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "REFrostedViewController.h"
#import "SDUFacebookData.h"

@interface SDUMenuViewController : UITableViewController

@property (weak, nonatomic) FBGraphObject *user;

@end
