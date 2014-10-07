//
//  SDURestListViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDURestMapListViewController.h"
#import "SDURest.h"
#import "SDURestDetailViewController.h"
#import "NSString+NSString_extended.h"

@interface SDURestMapListViewController ()
{
    SDURestMapListModel *_SDURestMapListModel;
    NSArray *_feedItems;
}

@end

@implementation SDURestMapListViewController

@synthesize restaurants = _restaurants;
@synthesize annotations = _annotations;
@synthesize mood = _mood;
@synthesize listView = _listView;
@synthesize tappedAnnotation = _tappedAnnotation;
@synthesize mapView = _mapView;
@synthesize flipButton = _flipButton;
@synthesize displayingListView = _displayingListView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.restaurants = [[NSMutableArray alloc]init];
    self.annotations = [[NSMutableArray alloc]init];
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _SDURestMapListModel = [[SDURestMapListModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _SDURestMapListModel.delegate = self;
    
    //URL encode the mood
    NSString *URLMood = [_mood urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
    // Call the download items method of the home model object
    [_SDURestMapListModel downloadItems:URLMood];
    
    //Boolean to flip between list and map views
    self.displayingListView = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.title = self.mood;
    [self.listView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)restDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    [self.restaurants addObjectsFromArray:_feedItems];
    
    //Add annotations to map
    for (SDURest *rest in self.restaurants) {
        SDURestListAnnotation *newAnnotation = [[SDURestListAnnotation alloc]initWithRest:rest];
        [self.annotations addObject:newAnnotation];
    }
    [self.mapView addAnnotations:self.annotations];
    
    //Center map and zoom in
    CLLocationCoordinate2D center;
    center.latitude = (double) 40.727221;
    center.longitude = (double) -73.99406899999997;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(center, 3000, 3000);
    [self.mapView setRegion:region animated:YES];
    
    // Reload the table view
    [self.listView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RestCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SDURest *currentRest = [self.restaurants objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentRest.name;
    
    return cell;
}

#pragma mark - Map management

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"myAnnotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView)
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorPurple;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    self.tappedAnnotation = (SDURestListAnnotation *)view.annotation;
    [self performSegueWithIdentifier:@"RestDetailSegue2" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RestDetailSegue"]) {
        SDURestDetailViewController *restDetailViewController = segue.destinationViewController;
        restDetailViewController.curRest = [self.restaurants objectAtIndex:self.listView.indexPathForSelectedRow.row];
        
    }else if ([segue.identifier isEqualToString:@"RestDetailSegue2"]) {
        SDURestDetailViewController *restDetailViewController = segue.destinationViewController;
        restDetailViewController.curAnnotation = self.tappedAnnotation;
        restDetailViewController.curRest = restDetailViewController.curAnnotation.rest;
    }
}

#pragma mark - IBActions

- (IBAction)flipBetweenViews:(id)sender
{
    [UIView transitionWithView:self.view
                      duration:1.0
                       options:(self.displayingListView ? UIViewAnimationOptionTransitionFlipFromRight :
                                UIViewAnimationOptionTransitionFlipFromLeft)
                    animations: ^{
                        if(self.displayingListView)
                        {
                            self.listView.hidden = true;
                            self.mapView.hidden = false;
                        }
                        else
                        {
                            self.listView.hidden = false;
                            self.mapView.hidden = true;
                        }
                    }
     
                    completion:^(BOOL finished) {
                        if (finished) {
                            self.displayingListView = !self.displayingListView;
                        }
                    }];
    if (self.displayingListView) {
        [self.flipButton setTitle:@"List"];
    }
    else
    {
        [self.flipButton setTitle:@"Map"];
    }
}

@end
