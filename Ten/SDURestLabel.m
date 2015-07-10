//
//  SDURestLabel.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDURestLabel.h"
#import "SDUScreenSizes.h"

@implementation SDURestLabel

- (instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    CGRect restLabelFrame = CGRectMake(screenSizes.screenWidth/3-1.5*screenSizes.buttonRadius, screenSizes.screenHeight*0.48 - screenSizes.navigationBarHeight, 2*screenSizes.buttonRadius, screenSizes.buttonRadius/2);
    self.frame = restLabelFrame;
    self.text = @"Eat";
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];

    return self;
}

@end
