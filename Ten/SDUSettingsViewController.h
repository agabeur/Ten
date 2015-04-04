//
//  SDUSettingsViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 07/10/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "REFrostedViewController.h"
#import "SDUFacebookData.h"

@interface SDUSettingsViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *logoutButton;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) FBGraphObject *user;

- (IBAction)showMenu:(id)sender;

@end
