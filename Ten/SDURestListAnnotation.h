//
//  SDURestListAnnotation.h
//  Ten
//
//  Created by Stanislas Duthoit on 05/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "SDURest.h"

@interface SDURestListAnnotation : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic) SDURest *rest;

-(id) initWithRest:(SDURest *)rest;

@end