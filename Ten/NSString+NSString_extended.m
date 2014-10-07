//
//  NSString+NSString_extended.m
//  Ten
//
//  Created by Stanislas Duthoit on 04/10/2014.
//  Copyright (c) 2014 Stanislas Duthoit. All rights reserved.
//

#import "NSString+NSString_extended.h"

@implementation NSString (NSString_extended)

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding)));
}

@end
