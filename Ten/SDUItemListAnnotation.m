//
//  SDUItemListAnnotation.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItemListAnnotation.h"

@implementation SDUItemListAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _coordinate;
@synthesize item = _item;

- (id)initWithItem:(SDUItem *)item
{
    if ((self = [super init])) {
        self.item = item;
        self.title = item.name;
        self.subtitle = [NSString stringWithFormat:@"%d",item.relevance];
        self.coordinate = item.coordinates;
    }
    return self;
}


@end
