//
//  SDUBarDetailViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarDetailViewController.h"

@interface SDUBarDetailViewController ()

@end

@implementation SDUBarDetailViewController

@synthesize addressLabel = _addressLabel;
@synthesize relevanceLabel = _relevanceLabel;
@synthesize detailMapView = _detailMapView;
@synthesize curBar = _curBar;
@synthesize curAnnotation = _curAnnotation;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addressLabel.text = self.curBar.address;
    self.relevanceLabel.text = [NSString stringWithFormat:@"%d", self.curBar.relevance];
    
    //Add pin to map
    SDUBarListAnnotation *newAnnotation = [[SDUBarListAnnotation alloc]initWithBar:self.curBar];
    [self.detailMapView addAnnotation:newAnnotation];
    
    //Center map on pin and zoom in
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.curBar.coordinates, 3000, 3000);
    [self.detailMapView setRegion:[self.detailMapView regionThatFits:region] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.curBar.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

@end
