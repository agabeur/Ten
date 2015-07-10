//
//  SDURestTagView.m
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDURestTagView.h"
#import "SDUScreenSizes.h"

@implementation SDURestTagView

-(instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];

    //    Create restTagView
    CGRect restTagFrame = CGRectMake(0, screenSizes.screenHeight*2/3 - screenSizes.navigationBarHeight, screenSizes.screenWidth, screenSizes.screenHeight*1/3);
    self.frame = restTagFrame;
    self.backgroundColor = [UIColor whiteColor];
    
    //    Create and add buttons
    CGRect button0Frame = CGRectMake(0, 0, screenSizes.screenWidth/2, restTagFrame.size.height/3);
     self.button0 = [[UIButton alloc] initWithFrame:button0Frame];
    self.button0.backgroundColor = [UIColor colorWithRed:0.995 green:0.745 blue:0.037 alpha:1.000];
//    [self.button0 addTarget:self.superview action:@selector(clickedRestTagButton:) forControlEvents:UIControlEventTouchUpInside];
    self.button0.tag = 0;
    [self addSubview:self.button0];
    
    CGRect button1Frame = CGRectMake(screenSizes.screenWidth/2, 0, screenSizes.screenWidth/2, restTagFrame.size.height/3);
    self.button1 = [[UIButton alloc] initWithFrame:button1Frame];
    self.button1.backgroundColor = [UIColor colorWithRed:0.043 green:0.345 blue:0.533 alpha:1.000];
    [self addSubview:self.button1];
    
    CGRect button2Frame = CGRectMake(0, restTagFrame.size.height/3, screenSizes.screenWidth/2, restTagFrame.size.height/3);
    self.button2 = [[UIButton alloc] initWithFrame:button2Frame];
    self.button2.backgroundColor = [UIColor colorWithRed:0.739 green:0.000 blue:0.930 alpha:1.000];
    [self addSubview:self.button2];
    
    CGRect button3Frame = CGRectMake(screenSizes.screenWidth/2, restTagFrame.size.height/3, screenSizes.screenWidth/2, restTagFrame.size.height/3);
    self.button3 = [[UIButton alloc] initWithFrame:button3Frame];
    self.button3.backgroundColor = [UIColor colorWithRed:0.986 green:0.000 blue:0.192 alpha:1.000];
    [self addSubview:self.button3];
    
    CGRect button4Frame = CGRectMake(0, restTagFrame.size.height*2/3, screenSizes.screenWidth/2, restTagFrame.size.height/3);
    self.button4 = [[UIButton alloc] initWithFrame:button4Frame];
    self.button4.backgroundColor = [UIColor colorWithRed:0.264 green:0.467 blue:0.008 alpha:1.000];
    [self addSubview:self.button4];
    
    CGRect button5Frame = CGRectMake(screenSizes.screenWidth/2, restTagFrame.size.height*2/3, screenSizes.screenWidth/2, restTagFrame.size.height/3);
    self.button5 = [[UIButton alloc] initWithFrame:button5Frame];
    self.button5.backgroundColor = [UIColor colorWithRed:0.201 green:0.000 blue:0.998 alpha:1.000];
    [self addSubview:self.button5];
    
    self.hidden = YES;
    
    return self;
}

@end
