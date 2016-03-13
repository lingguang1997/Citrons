//
//  CTButtonIconCell.h
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import <AppKit/AKTableViewCell.h>

static NSString * const kCTIconCellTitleKey     = @"CTIconCellTitleKey";
static NSString * const kCTIconCellIconKey      = @"CTIconCellIconKey";
static NSString * const kCTIconCellDataKey      = @"CTIconCellDataKey";

@interface CTIconCell : AKTableViewCell
- (void)updateNumber:(CGFloat)number;
@end