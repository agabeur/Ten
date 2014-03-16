//
//  SDUBarDetailViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDUBarListAnnotation.h"
#import "SDUBar.h"

@interface SDUBarDetailViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *relevanceLabel;
@property (nonatomic, strong) IBOutlet MKMapView *detailMapView;

@property (nonatomic, strong) SDUBar *curBar;
@property (nonatomic, strong) SDUBarListAnnotation *curAnnotation;


@end
