//
//  UIImage+CTImage.m
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import "UIImage+CTImage.h"

@implementation UIImage (CTImage)

+ (instancetype)ct_profilePlaceHolder {
    return [UIImage imageNamed:@"ProfilePlaceholder"];
}

+ (instancetype)ct_imageWithColor:(UIColor *)color {
    return [self ct_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (instancetype)ct_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
