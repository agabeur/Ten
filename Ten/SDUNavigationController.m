//
//  SDUNavigationController.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUNavigationController.h"
#import "UIImage+Tint.h"

@interface SDUNavigationController ()

@end

@implementation SDUNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    shadow.shadowColor = [UIColor colorWithWhite:0.298 alpha:1.000];
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor whiteColor],
                                                            NSFontAttributeName: [UIFont fontWithName:@"Gill Sans" size:25.0f],
                                                            NSShadowAttributeName: shadow
                                                            }];
    
    // Set Back Button
    UIImage *backBtn = [UIImage imageNamed:@"Left Filled-50.png"];
    backBtn = [backBtn imageTintedWithColor:[UIColor whiteColor]];
    backBtn = [backBtn imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 13, 0);
    backBtn = [backBtn imageWithAlignmentRectInsets:insets];
    [UINavigationBar appearance].backIndicatorImage = backBtn;
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = backBtn;

}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController panGestureRecognized:sender];
}


@end
