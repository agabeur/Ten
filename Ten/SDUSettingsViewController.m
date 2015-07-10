//
//  SDUSettingsViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 07/10/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUSettingsViewController.h"
#import "SDULoginViewController.h"

@interface SDUSettingsViewController ()

@end

@implementation SDUSettingsViewController

@synthesize profilePicture = _profilePicture;
@synthesize name = _name;
@synthesize user = _user;

- (void)showMenu:(id)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    self.profilePicture.profileID = [self.user objectForKey:@"id"];
    self.name.text = [self.user objectForKey:@"name"];
    self.logoutButton.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    
    SDULoginViewController *loginHomeView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginHomeView"];
    [self presentViewController:loginHomeView animated:NO completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
