//
//  SDUItemHomeViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItemHomeViewController.h"
#import "SDUItemMapListViewController.h"

@interface SDUItemHomeViewController ()

@end

@implementation SDUItemHomeViewController

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
    // Set back button title
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIButton *clickedMood = (UIButton *)sender;
    NSString *itemListMood = clickedMood.currentTitle;
    SDUItemMapListViewController *itemMapListViewController = segue.destinationViewController;
    itemMapListViewController.mood = itemListMood;
}
@end
