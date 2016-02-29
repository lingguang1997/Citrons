//
//  UIView+InterfaceBuilder.h
//  Citron
//
//  Created by Zijiao Liu on 2/25/16.
//  Copyright © 2016 iAskData. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (InterfaceBuilder)

+ (nonnull instancetype)ct_loadFromNib;
- (nonnull NSArray *)ct_setLeadingSpaceToSuperview:(CGFloat)leading;
- (nonnull NSArray *)ct_setTrailingSpaceToSuperview:(CGFloat)trailing;
- (nonnull NSArray *)ct_setTopSpaceToSuperview:(CGFloat)top;
- (nonnull NSArray *)ct_setBottomSpaceToSuperview:(CGFloat)bottom;
- (nonnull NSArray *)ct_setWidth:(CGFloat)height;
- (nonnull NSArray *)ct_setHeight:(CGFloat)height;
- (nonnull NSArray *)ct_setTopSpace:(CGFloat)top toView:(nonnull UIView *)view;

@end
