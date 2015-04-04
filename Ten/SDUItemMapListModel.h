//
//  SDUMapListModel.h
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDUItem.h"

@protocol SDUItemMapListModelProtocol <NSObject>

- (void)itemDownloaded:(NSArray *)items;

@end

@interface SDUItemMapListModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SDUItemMapListModelProtocol> delegate;

- (void)downloadItems:(NSString *)mood;

@end