//
//  SDUBarLabel.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarLabel.h"
#import "SDUScreenSizes.h"

@implementation SDUBarLabel

-(instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    CGRect barLabelFrame = CGRectMake(screenSizes.screenWidth*2/3-0.5*screenSizes.buttonRadius, screenSizes.screenHeight*0.48 - screenSizes.navigationBarHeight, 2*screenSizes.buttonRadius, screenSizes.buttonRadius/2);
    self = [[UILabel alloc] initWithFrame:barLabelFrame];
    self.text = @"Drink";
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor whiteColor];

    return self;
}

@end
