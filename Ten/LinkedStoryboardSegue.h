//
//  LinkedStoryboardSegue.h
//  Ten
//
//  Created by Stanislas Duthoit on 14/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinkedStoryboardSegue : UIStoryboardSegue

+ (UIViewController *)sceneNamed:(NSString *)identifier;

@end
