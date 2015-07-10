//
//  SDUAddRestTableViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 10/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUAddRestTableViewController.h"
#import "SDUMyRestViewController.h"
#import "SDUNavigationController.h"
#import "UIViewController+REFrostedViewController.h"

@interface SDUAddRestTableViewController ()
{
    SDUAddRestModel *_SDUAddRestModel;
    NSArray *_pickerData;
}

@end

@implementation SDUAddRestTableViewController

@synthesize addressLabel = _addressLabel;
@synthesize relevanceLabel = _relevanceLabel;
@synthesize critiqueText = _critiqueText;
@synthesize detailMapView = _detailMapView;
@synthesize curRest = _curRest;
@synthesize curAnnotation = _curAnnotation;
@synthesize mood = _mood;

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
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    
    //Initialize picker data
    _pickerData = @[@"Date", @"Friends", @"Parents", @"Kids", @"Work"];
    
    //Add placeholder in critiqueText UIPlaceHolderView
    self.critiqueText.placeholderText = @"Enter your critique here";
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

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}
- (void)addRest:(id)sender {
    
    NSDictionary *moods = [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"Date",
                           @"2", @"Friends",
                           @"3", @"Parents",
                           @"4", @"Kids",
                           @"5", @"Work",
                           nil];

    
    _mood = _pickerData[[self.picker selectedRowInComponent:0]];
    _SDUAddRestModel = [[SDUAddRestModel alloc]init];
    _SDUAddRestModel.moodid = [moods objectForKey:self.mood];
    _SDUAddRestModel.delegate = self;
    [_SDUAddRestModel addRest:self.curRest];
    SDUMyRestViewController *myRestViewController = [self.navigationController.viewControllers objectAtIndex:1];
    [myRestViewController.listView reloadData];
    [self.navigationController popToViewController:myRestViewController animated:YES];
}

@end
