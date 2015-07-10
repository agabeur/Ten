//
//  SDUAddRestTableViewController.h
//  Ten
//
//  Created by Stanislas Duthoit on 10/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SDURestListAnnotation.h"
#import "SDURest.h"
#import "SDUAddRestModel.h"
#import "UIPlaceHolderTextView.h"

@interface SDUAddRestTableViewController : UITableViewController<SDUAddRestModelProtocol, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel *relevanceLabel;
@property (nonatomic, strong) IBOutlet UIPlaceHolderTextView *critiqueText;
@property (nonatomic, strong) IBOutlet MKMapView *detailMapView;

@property (nonatomic, strong) SDURest *curRest;
@property (nonatomic, strong) SDURestListAnnotation *curAnnotation;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSString *mood;

- (IBAction)addRest:(id)sender;

@end
