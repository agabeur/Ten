//
//  SDURestDetailViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDURestDetailViewController.h"

@interface SDURestDetailViewController ()

@end

@implementation SDURestDetailViewController

@synthesize addressLabel = _addressLabel;
@synthesize relevanceLabel = _relevanceLabel;
@synthesize detailMapView = _detailMapView;
@synthesize curRest = _curRest;
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
    self.addressLabel.text = self.curRest.address;
    self.relevanceLabel.text = [NSString stringWithFormat:@"%d", self.curRest.relevance];
    
    //Add pin to map
    SDURestListAnnotation *newAnnotation = [[SDURestListAnnotation alloc]initWithRest:self.curRest];
    [self.detailMapView addAnnotation:newAnnotation];
    
    //Center map on pin and zoom in
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.curRest.coordinates, 3000, 3000);
    [self.detailMapView setRegion:[self.detailMapView regionThatFits:region] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.curRest.name;
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