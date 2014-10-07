//
//  SDURestMapListModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 29/09/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDURest.h"

@protocol SDURestMapListModelProtocol <NSObject>

- (void)restDownloaded:(NSArray *)items;

@end

@interface SDURestMapListModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDURestMapListModelProtocol> delegate;

- (void)downloadItems:(NSString *)mood;

@end
