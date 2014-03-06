//
//  SDURestHomeViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDURestHomeViewController.h"
#import "SDURestListViewController.h"

@interface SDURestHomeViewController ()

@end

@implementation SDURestHomeViewController

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
    NSString *restListMood = clickedMood.currentTitle;
    SDURestListViewController *restListViewController = segue.destinationViewController;
    restListViewController.mood = restListMood;
}
@end
