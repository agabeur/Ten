//
//  SDUFriend.h
//  Ten
//
//  Created by Stanislas Duthoit on 13/05/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDURest.h"
#import "SDUBar.h"

@interface SDUFriend : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSArray *restList;

@property (nonatomic, strong) NSArray *barList;

- (id) initWithName:(NSString*) name;

@end
