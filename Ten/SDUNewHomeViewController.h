//
//  SDUNewHomeViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 26/05/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SDUFacebookData.h"
#import "SDULoginModel.h"

@interface SDUNewHomeViewController : UITabBarController <CLLocationManagerDelegate, FBLoginViewDelegate, UIScrollViewDelegate, SDULoginModelProtocol, UITableViewDataSource, UITableViewDelegate>

- (void) restButtonClicked;
- (void) barButtonClicked;
- (void) addScroolView;
- (void) addLocationLabel;
- (void) addRestButton;
- (void) addBarButton;
- (void) addRestLabel;
- (void) addBarLabel;
- (void) addRestTagView;
- (void) addBarTagView;
- (void) addLoginView;
- (void) addShortProfileView:(id<FBGraphUser>)user;
- (void) displayTagView:(UIView *) tagView;
- (void) hideTagView:(UIView *) tagView;
- (void) clickedRestTagButton:(UIButton*)sender;
- (void) clickedBarTagButton;
- (void) clickedProfilePicture;
- (void) addSearchBar;

@end
