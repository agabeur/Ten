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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.logoutButton.delegate = self;
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
