//
//  UIColor+CTColor.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "UIColor+CTColor.h"

@implementation UIColor (CTColor)

+ (instancetype)ct_blueColor {
    return [UIColor colorWithRed:48.0 / 255 green:182.0 / 255 blue:252.0 / 255 alpha:1];
}

+ (instancetype)ct_grayColor {
    return [UIColor grayColor];
}

+ (instancetype)ct_textDarkBlueColor {
    return [UIColor colorWithRed:62.0 / 255 green:102.0 / 255 blue:112.0 / 255 alpha:1];
}

+ (instancetype)ct_lightBlueColor {
    return [UIColor colorWithRed: 43.0 / 255 green: 175.0 / 255 blue: 243.0 / 255 alpha:1];
}

@end
