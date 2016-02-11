//
//  UIFont+CTFont.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "UIFont+CTFont.h"

@implementation UIFont (CTFont)

+ (instancetype)ct_appFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Helvetica" size:size];
}

+ (instancetype)ct_appBoldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

@end
