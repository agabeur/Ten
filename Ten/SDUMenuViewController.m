//
//  SDUMenuViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUMenuViewController.h"
#import "SDURestHomeViewController.h"
#import "SDUBarHomeViewController.h"
#import "SDUMyListsHomeViewController.h"
#import "SDUSettingsViewController.h"
#import "SDUNavigationController.h"
#import "UIViewController+REFrostedViewController.h"
//#import "SDULoginViewController.m"

@interface SDUMenuViewController ()

@end

@implementation SDUMenuViewController
@synthesize user = _user;

- (void)viewDidLoad
{
    [super viewDidLoad];

    SDUFacebookData *facebookData = [SDUFacebookData sharedFacebookData];
    self.user = facebookData.user;
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        FBProfilePictureView *profilePicture = [[FBProfilePictureView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        profilePicture.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        profilePicture.profileID = [self.user objectForKey:@"id"];
        profilePicture.layer.masksToBounds = YES;
        profilePicture.layer.cornerRadius = 50.0;
        profilePicture.layer.borderColor = [UIColor whiteColor].CGColor;
        profilePicture.layer.borderWidth = 3.0f;
        profilePicture.layer.rasterizationScale = [UIScreen mainScreen].scale;
        profilePicture.layer.shouldRasterize = YES;
        profilePicture.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Ten";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:profilePicture];
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"Friends Online";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}*/

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SDUNavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        SDURestHomeViewController *restHomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"restaurantsController"];
        navigationController.viewControllers = @[restHomeViewController];
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        SDUBarHomeViewController *barHomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"barsController"];
        navigationController.viewControllers = @[barHomeViewController];
    } else if (indexPath.section == 0 && indexPath.row == 2){
        SDUMyListsHomeViewController *myListsHomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myListsController"];
        navigationController.viewControllers = @[myListsHomeViewController];
    } else if (indexPath.section == 0 && indexPath.row == 3){
        SDUMyListsHomeViewController *myListsHomeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"myFriendsController"];
        navigationController.viewControllers = @[myListsHomeViewController];
    } else if (indexPath.section == 0 && indexPath.row == 4){
        SDUSettingsViewController *settingsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsViewController"];
        navigationController.viewControllers = @[settingsViewController];
    }
    
    self.frostedViewController.contentViewController = navigationController;
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableView.frame.size.height / 8 ;
    //return 70;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Restaurants", @"Bars", @"Me", @"Following",@"Settings"];
        cell.textLabel.text = titles[indexPath.row];
    }
    return cell;
}

@end