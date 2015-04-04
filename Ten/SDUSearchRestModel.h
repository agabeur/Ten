//
//  SDUAddRestModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 09/11/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDURest.h"
#import <CoreLocation/CoreLocation.h>

@protocol SDUSearchRestModelProtocol <NSObject>

- (void)restSearchDownloaded:(NSArray *)items;

@end

@interface SDUSearchRestModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDUSearchRestModelProtocol> delegate;

@property(strong, nonatomic) CLLocationManager *locationManager;
@property(weak, nonatomic) NSString *latitude;
@property(weak, nonatomic) NSString *longitude;

- (void)downloadItems:(NSString *)searchText;

@end
