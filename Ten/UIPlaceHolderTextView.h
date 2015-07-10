//
//  UIPlaceHolderTextView.h
//  Ten
//
//  Created by Stanislas Duthoit on 08/04/2015.
//  Copyright (c) 2015 Stanislas Duthoit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

// Named .placeholderText, in case UITextView gains
// a .placeholder property (like UITextField) in future iOS versions.
@property (nonatomic, copy) NSString *placeholderText;

@end