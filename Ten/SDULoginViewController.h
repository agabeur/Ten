//
//  SDULoginViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 07/07/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SDUFacebookData.h"
#import "SDULoginModel.h"

@interface SDULoginViewController : UIViewController <FBLoginViewDelegate, SDULoginModelProtocol>

@property (weak, nonatomic) IBOutlet FBLoginView *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *lblLoginStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblUsername;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePicture;

@end
