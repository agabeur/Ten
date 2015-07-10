//
//  SDUTabBarMenuViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 17/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUTabBarMenuViewController.h"

@interface SDUTabBarMenuViewController ()

@end

@implementation SDUTabBarMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBar *tabBar = self.tabBar;
    
    tabBar.barTintColor = [UIColor whiteColor];
    tabBar.tintColor = [UIColor colorWithRed:0.169 green:0.479 blue:0.709 alpha:1.000];
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];

    
    tabBarItem1.title = @"";
//    tabBarItem1.image = [[UIImage imageNamed:@"dining_room-32.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.image = [UIImage imageNamed:@"dining_room-32.png"];
    tabBarItem1.selectedImage = [UIImage imageNamed:@"dining_room-32.png"];
    
    tabBarItem2.title = @"";
    tabBarItem2.image = [UIImage imageNamed:@"cocktail-32.png"];
    tabBarItem2.selectedImage = [UIImage imageNamed:@"cocktail-32.png"];
    
    tabBarItem3.title = @"";
    tabBarItem3.image = [UIImage imageNamed:@"Plus Math-32.png"];
    tabBarItem3.selectedImage = [UIImage imageNamed:@"Plus Math-32.png"];
    
    tabBarItem4.title = @"";
    tabBarItem4.image = [UIImage imageNamed:@"Group Filled-32.png"];
    tabBarItem4.selectedImage = [UIImage imageNamed:@"Group Filled-32.png"];
    
    tabBarItem5.title = @"";
    tabBarItem5.image = [UIImage imageNamed:@"User Male Circle Filled-32.png"];
    tabBarItem5.selectedImage = [UIImage imageNamed:@"User Male Circle Filled-32.png"];

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
