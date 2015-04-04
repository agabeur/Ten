//
//  SDUItemMapListViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDUItemListAnnotation.h"
#import "SDUItemMapListModel.h"
#import <CoreLocation/CoreLocation.h>

@interface SDUItemMapListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate, CLLocationManagerDelegate, SDUItemMapListModelProtocol>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSString *mood;
@property (nonatomic) BOOL displayingListView;
@property (nonatomic, strong) SDUItemListAnnotation *tappedAnnotation;

@property (nonatomic, strong) IBOutlet UITableView *listView;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *mapButton;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *listButton;

- (IBAction)flipBetweenViews:(id)sender;
- (IBAction)centerMapOnUserButtonClicked:(id)sender;

@end