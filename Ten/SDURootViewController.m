//
//  SDURootViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDURootViewController.h"

@interface SDURootViewController ()

@end

@implementation SDURootViewController

@synthesize profileImage = _profileImage;

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
    //self.menuViewController.image = self.profileImage;
    //[self.menuViewController.view addSubview:image];
}

@end
