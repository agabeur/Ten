//
//  SDULoginViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 07/07/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDULoginViewController.h"
#import "SDUMenuViewController.h"
#import "SDURootViewController.h"
#import "SDURestHomeViewController.h"

@interface SDULoginViewController ()
{
    SDULoginModel *_SDULoginModel;
    BOOL _isAlreadyUser;
}

-(void)toggleHiddenState:(BOOL)shouldHide;

@end

@implementation SDULoginViewController

@synthesize profilePicture = _profilePicture;

- (void)toggleHiddenState:(BOOL)shouldHide{
    self.lblUsername.hidden = shouldHide;
    self.lblEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _SDULoginModel = [[SDULoginModel alloc] init];
    _isAlreadyUser = NULL;
    
    _SDULoginModel.delegate = self;
    
    self.loginButton.delegate = self;
    [self toggleHiddenState:YES];
    self.lblLoginStatus.text = @"";
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
}

- (void)isAlreadyUser:(BOOL)isAlreadyUser{
    _isAlreadyUser = isAlreadyUser;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
    
    SDURootViewController *rootController = [self.storyboard instantiateViewControllerWithIdentifier:@"rootController"];
    [self presentViewController:rootController animated:NO completion:nil];
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    self.lblLoginStatus.text = @"You are logged out";
    
    [self toggleHiddenState:YES];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.profilePicture.profileID = user.objectID;
    self.lblUsername.text = user.name;
    self.lblEmail.text = [user objectForKey:@"email"];
    
    facebookData.user = user;
    
    [_SDULoginModel uploadFBData:user];
    
    /* make the API call */
    [FBRequestConnection startWithGraphPath:@"/me/friends"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              /* handle the result */
                              NSDictionary *userData = (NSDictionary *)result;
                              
                          }];
    
    
    
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    SDUMenuViewController *menuViewController = segue.destinationViewController;
    menuViewController.menuProfileImage = self.profileImage;
}*/

@end
