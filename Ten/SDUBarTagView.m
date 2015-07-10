//
//  SDUBarTagView.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarTagView.h"
#import "SDUScreenSizes.h"

@implementation SDUBarTagView

-(instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    //    Create barTagView
    CGRect barTagFrame = CGRectMake(0, screenSizes.screenHeight*2/3 - screenSizes.navigationBarHeight, screenSizes.screenWidth, screenSizes.screenHeight*1/3);
    self.frame  = barTagFrame;
    self.backgroundColor = [UIColor whiteColor];
    
    //    Create and add buttons
    CGRect button0Frame = CGRectMake(0, 0, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button0 = [[UIButton alloc] initWithFrame:button0Frame];
    button0.backgroundColor = [UIColor colorWithRed:0.114 green:0.871 blue:0.353 alpha:1.000];
    [self addSubview:button0];
    
    CGRect button1Frame = CGRectMake(screenSizes.screenWidth/2, 0, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button1 = [[UIButton alloc] initWithFrame:button1Frame];
    button1.backgroundColor = [UIColor colorWithRed:0.185 green:0.000 blue:0.998 alpha:1.000];
    [self addSubview:button1];
    
    CGRect button2Frame = CGRectMake(0, barTagFrame.size.height/3, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button2 = [[UIButton alloc] initWithFrame:button2Frame];
    button2.backgroundColor = [UIColor colorWithRed:0.986 green:0.000 blue:0.027 alpha:1.000];
    [self addSubview:button2];
    
    CGRect button3Frame = CGRectMake(screenSizes.screenWidth/2, barTagFrame.size.height/3, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button3 = [[UIButton alloc] initWithFrame:button3Frame];
    button3.backgroundColor = [UIColor colorWithRed:0.332 green:0.949 blue:0.625 alpha:1.000];
    [self addSubview:button3];
    
    CGRect button4Frame = CGRectMake(0, barTagFrame.size.height*2/3, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button4 = [[UIButton alloc] initWithFrame:button4Frame];
    button4.backgroundColor = [UIColor colorWithRed:0.647 green:0.105 blue:0.013 alpha:1.000];
    [self addSubview:button4];
    
    CGRect button5Frame = CGRectMake(screenSizes.screenWidth/2, barTagFrame.size.height*2/3, screenSizes.screenWidth/2, barTagFrame.size.height/3);
    UIButton *button5 = [[UIButton alloc] initWithFrame:button5Frame];
    button5.backgroundColor = [UIColor colorWithRed:0.239 green:0.326 blue:0.005 alpha:1.000];
    [self addSubview:button5];
    
    self.hidden = YES;

    return self;
}

@end
