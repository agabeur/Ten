//
//  SDUHomeViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 13/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUHomeViewController.h"

@interface SDUHomeViewController ()

@end

@implementation SDUHomeViewController

- (void)showMenu:(id)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

@end
