//
//  SDUFriendRestDetailViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 18/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDURestListAnnotation.h"
#import "SDURest.h"

@interface SDUFriendRestDetailViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *relevanceLabel;
@property (nonatomic, strong) IBOutlet MKMapView *detailMapView;

@property (nonatomic, strong) SDURest *curRest;
@property (nonatomic, strong) SDURestListAnnotation *curAnnotation;

@end
