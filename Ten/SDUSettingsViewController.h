//
//  SDUSettingsViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 07/10/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SDUSettingsViewController : UIViewController <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *logoutButton;

@end
