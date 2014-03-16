//
//  SDUBarMapListViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDUBarListAnnotation.h"

@interface SDUBarMapListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate>

@property (nonatomic, strong) NSMutableArray *bars;
@property (nonatomic, strong) NSMutableArray *annotations;
@property (nonatomic, strong) NSString *mood;
@property (nonatomic) BOOL displayingListView;
@property (nonatomic, strong) SDUBarListAnnotation *tappedAnnotation;

@property (nonatomic, strong) IBOutlet UITableView *listView;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *flipButton;

- (IBAction)flipBetweenViews:(id)sender;


@end
