//
//  UIImage+CTImage.h
//  Citron
//
//  Created by Zijiao Liu on 1/11/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CTImage)

+ (nonnull instancetype)ct_profilePlaceHolder;
+ (nonnull instancetype)ct_imageWithColor:(nonnull UIColor *)color;
+ (nonnull instancetype)ct_imageWithColor:(nonnull UIColor *)color size:(CGSize)size;

@end
