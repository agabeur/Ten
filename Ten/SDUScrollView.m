//
//  SDUScrollView.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUScrollView.h"
#import "SDUScreenSizes.h"

@implementation SDUScrollView

- (instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    CGRect scrollViewFrame = screenSizes.screenFrame;
    scrollViewFrame.size.height = scrollViewFrame.size.height - screenSizes.navigationBarHeight;
    self.frame = scrollViewFrame;
    self.contentSize = CGSizeMake(screenSizes.screenWidth, screenSizes.screenHeight + 5 - screenSizes.navigationBarHeight);
    self.backgroundColor = [UIColor colorWithRed:0.208f green:0.267f blue:0.345f alpha:1.00f];
    self.showsVerticalScrollIndicator = YES;
    self.scrollEnabled = YES;
    
    return self;
}

@end
