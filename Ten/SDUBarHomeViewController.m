//
//  SDUBarHomeViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarHomeViewController.h"
#import "SDUBarMapListViewController.h"

@interface SDUBarHomeViewController ()

@end

@implementation SDUBarHomeViewController

-(void)showMenu:(id)sender
{
    // Dismiss keyboard (optional)
    //
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    
    // Present the view controller
    //
    [self.frostedViewController presentMenuViewController];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *clickedMood = (UIButton *)sender;
    NSString *barListMood = clickedMood.currentTitle;
    SDUBarMapListViewController *barListViewController = segue.destinationViewController;
    barListViewController.mood = barListMood;
}
@end
