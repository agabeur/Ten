//
//  SDURestButton.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDURestButton.h"
#import "SDUScreenSizes.h"
#import "UIImage+Tint.h"

@implementation SDURestButton

- (instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    self = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect restButtonFrame = CGRectMake(screenSizes.screenWidth/3 - 1.5*screenSizes.buttonRadius, screenSizes.screenHeight*2/5 - screenSizes.buttonRadius - screenSizes.navigationBarHeight, 2*screenSizes.buttonRadius, 2*screenSizes.buttonRadius);
    self.frame = restButtonFrame;
    self.layer.cornerRadius = screenSizes.buttonRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0;
    self.layer.borderColor = [UIColor colorWithRed:0.892 green:0.357 blue:0.305 alpha:1.000].CGColor;
    UIImage *restImage = [[UIImage imageNamed:@"dining_room-32.png"] imageTintedWithColor:[UIColor whiteColor]];
    [self setImage:restImage forState:UIControlStateNormal];
    self.backgroundColor = [UIColor colorWithRed:0.922f green:0.447f blue:0.376f alpha:1.00f];
    
    return self;
}

@end
