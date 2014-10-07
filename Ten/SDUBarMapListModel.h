//
//  SDUBarMapListModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 04/10/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDUBar.h"

@protocol SDUBarMapListModelProtocol <NSObject>

- (void) barDownloaded:(NSArray *)items;

@end

@interface SDUBarMapListModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDUBarMapListModelProtocol> delegate;

- (void)downloadItems:(NSString *)mood;

@end
