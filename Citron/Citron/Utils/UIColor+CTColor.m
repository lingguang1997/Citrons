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

+ (instancetype)ct_yellowColor {
    return [UIColor colorWithRed: 254.0 / 255 green: 200.0 / 255 blue: 60.0 / 255 alpha:1];
}

+ (instancetype)ct_transparentWhiteColor {
    return [UIColor colorWithRed:1 green:1 blue:1 alpha:.4];
}

@end
