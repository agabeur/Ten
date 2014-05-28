//
//  SDUFriendProfileViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 17/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUFriendProfileViewController.h"

@interface SDUFriendProfileViewController ()

@end

@implementation SDUFriendProfileViewController

@synthesize friend = _friend;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.friend.name;
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

@end
