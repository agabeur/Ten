//
//  SDUItemListAnnotation.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import "SDUItemListAnnotation.h"
#import "UIImage+Tint.h"

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

- (MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"ItemAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [[UIImage imageNamed:@"Location Filled-32.png"] imageTintedWithColor:[UIColor colorWithRed:0.169 green:0.479 blue:0.709 alpha:1.000]];
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

@end
