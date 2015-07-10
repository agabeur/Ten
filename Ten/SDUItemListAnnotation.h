//
//  SDUItemListAnnotation.h
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "SDUItem.h"

@interface SDUItemListAnnotation : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic) SDUItem *item;

-(id) initWithItem:(SDUItem *)item;
- (MKAnnotationView *) annotationView;

@end