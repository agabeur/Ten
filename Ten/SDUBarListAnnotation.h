//
//  SDUBarListAnnotation.h
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "SDUBar.h"

@interface SDUBarListAnnotation : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic) SDUBar *bar;

-(id) initWithBar:(SDUBar *)bar;

@end
