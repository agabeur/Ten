//
//  SDURestListViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDURestListAnnotation.h"
#import "SDURestMapListModel.h"
#import <CoreLocation/CoreLocation.h>

@interface SDURestMapListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate, SDURestMapListModelProtocol>

@property (nonatomic, strong) NSMutableArray *restaurants;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSString *mood;
@property (nonatomic) BOOL displayingListView;
@property (nonatomic, strong) SDURestListAnnotation *tappedAnnotation;

@property (nonatomic, strong) IBOutlet UITableView *listView;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *mapButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *listButton;

- (IBAction)flipBetweenViews:(id)sender;
- (IBAction)centerMapOnUserButtonClicked:(id)sender;

@end