//
//  SDUBar.h
//  Ten
//
//  Created by Stanislas Duthoit on 16/03/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface SDUBar : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *address;

@property (nonatomic, assign) CLLocationCoordinate2D coordinates;

@property (nonatomic, assign) int relevance;

- (id) initWithName:(NSString *)name address:(NSString *)address coordinates:(CLLocationCoordinate2D) coordinates relevance:(int)relevance;

@end
