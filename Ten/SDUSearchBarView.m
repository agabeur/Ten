//
//  SDUSearchBarView.m
//  Ten
//
//  Created by Stanislas Duthoit on 18/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUSearchBarView.h"
#import "SDUScreenSizes.h"

@implementation SDUSearchBarView

-(instancetype)init
{
    self = [super init];
    
    SDUScreenSizes *screenSizes = [SDUScreenSizes sharedManager];
    
    CGRect searchBarFrame = CGRectMake(screenSizes.screenWidth/4, screenSizes.navigationBarHeight/4, screenSizes.screenWidth*2/4, screenSizes.navigationBarHeight/2);
    self.frame = searchBarFrame;
    
    UITextField *searchTextField = [self valueForKey:@"_searchField"];
    [searchTextField setBackgroundColor:[UIColor redColor]];
    
    [[self valueForKey:@"_searchField"] setBackgroundColor:[UIColor redColor]];
    [self setBarTintColor:[UIColor redColor]];
    
    return self;
    
}

@end
