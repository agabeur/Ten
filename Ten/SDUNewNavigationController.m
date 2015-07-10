//
//  SDUNewNavigationController.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUNewNavigationController.h"
#import "SDUNewHomeViewController.h"

@interface SDUNewNavigationController ()

@property CGFloat navigationBarWidth;
@property CGFloat navigationBarHeight;
@property UISearchBar *searchBar;

@end

@implementation SDUNewNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBarHeight = self.navigationBar.frame.size.height;
    self.navigationBarWidth = self.navigationBar.frame.size.width;
    
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.208f green:0.267f blue:0.345f alpha:1.00f]];
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
