//
//  SDUItemDetailTableViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDUItemListAnnotation.h"
#import "SDUItem.h"

@interface SDUItemDetailTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *relevanceLabel;
@property (nonatomic, strong) IBOutlet MKMapView *detailMapView;

@property (nonatomic, strong) SDUItem *curItem;
@property (nonatomic, strong) SDUItemListAnnotation *curAnnotation;

@end