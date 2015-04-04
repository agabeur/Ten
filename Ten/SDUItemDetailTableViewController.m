//
//  SDUItemDetailTableViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItemDetailTableViewController.h"

@interface SDUItemDetailTableViewController ()

@end

@implementation SDUItemDetailTableViewController

@synthesize addressLabel = _addressLabel;
@synthesize relevanceLabel = _relevanceLabel;
@synthesize detailMapView = _detailMapView;
@synthesize curItem = _curItem;
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
    self.addressLabel.text = self.curItem.address;
    self.relevanceLabel.text = [NSString stringWithFormat:@"%d", self.curItem.relevance];
    
    //Add pin to map
    SDUItemListAnnotation *newAnnotation = [[SDUItemListAnnotation alloc]initWithItem:self.curItem];
    [self.detailMapView addAnnotation:newAnnotation];
    
    //Center map on pin and zoom in
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.curItem.coordinates, 3000, 3000);
    [self.detailMapView setRegion:[self.detailMapView regionThatFits:region] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.curItem.name;
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
