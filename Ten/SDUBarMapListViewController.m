//
//  SDUBarMapListViewController.m
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "SDUBarMapListViewController.h"
#import "SDUBar.h"
#import "SDUBarDetailViewController.h"

@interface SDUBarMapListViewController ()

@end

@implementation SDUBarMapListViewController

@synthesize bars = _bars;
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
    self.bars = [[NSMutableArray alloc]init];
    self.annotations = [[NSMutableArray alloc]init];
    
    //Add example bar
    CLLocationCoordinate2D acmeC2D;
    acmeC2D.latitude = (double) 40.727221;
    acmeC2D.longitude = (double) -73.99406899999997;
    SDUBar *firstBar = [[SDUBar alloc]initWithName:@"ACME" address:@"9 Great Jones St New York, NY 10012" coordinates:acmeC2D relevance:189];
    [self.bars addObject:firstBar];
    
    
    //Add second example bar
    CLLocationCoordinate2D bondstC2D;
    bondstC2D.latitude = (double) 40.7269571;
    bondstC2D.longitude = (double) -73.99439899999999;
    SDUBar *secondBar = [[SDUBar alloc]initWithName:@"Bondst" address:@"6 Bond St New York, 10012" coordinates:bondstC2D relevance:210];
    [self.bars addObject:secondBar];
    
    //Boolean to flip between list and map views
    self.displayingListView = YES;
    
    //Add annotations to map
    for (SDUBar *bar in self.bars) {
        SDUBarListAnnotation *newAnnotation = [[SDUBarListAnnotation alloc]initWithBar:bar];
        [self.annotations addObject:newAnnotation];
    }
    [self.mapView addAnnotations:self.annotations];
    
    //Center map and zoom in
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(firstBar.coordinates, 3000, 3000);
    [self.mapView setRegion:region animated:YES];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BarCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    SDUBar *currentBar = [self.bars objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentBar.name;
    
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
    
    self.tappedAnnotation = (SDUBarListAnnotation *)view.annotation;
    [self performSegueWithIdentifier:@"BarDetailSegue2" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"BarDetailSegue"]) {
        SDUBarDetailViewController *barDetailViewController = segue.destinationViewController;
        barDetailViewController.curBar = [self.bars objectAtIndex:self.listView.indexPathForSelectedRow.row];
        
    }else if ([segue.identifier isEqualToString:@"BarDetailSegue2"]) {
        SDUBarDetailViewController *barDetailViewController = segue.destinationViewController;
        barDetailViewController.curAnnotation = self.tappedAnnotation;
        barDetailViewController.curBar = barDetailViewController.curAnnotation.bar;
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
