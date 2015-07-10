//
//  SDULocationLabel.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDULocationLabel.h"
#import "SDUScreenSizes.h"

@implementation SDULocationLabel

- (instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];
    
    CGRect locationLabelFrame = CGRectMake(screenSizes.screenWidth/6, screenSizes.screenHeight*1/5 - screenSizes.navigationBarHeight, screenSizes.screenWidth*2/3, 60);
    self.frame = locationLabelFrame;
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];
    self.font = [UIFont fontWithName:@"Arial" size:30.0];
    
    return self;
}

@end
