//
//  SDUScreenSizes.h
//  Ten
//
//  Created by Stanislas Duthoit on 20/06/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDUScreenSizes : NSObject

@property CGFloat screenWidth;
@property CGFloat screenHeight;
@property CGFloat navigationBarHeight;
@property CGRect screenFrame;
@property CGFloat buttonRadius;

+ (SDUScreenSizes*)sharedManager;

@end
