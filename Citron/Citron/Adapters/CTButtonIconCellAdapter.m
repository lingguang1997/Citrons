//
//  CTButtonIconCellAdapter.m
//  Citron
//
//  Created by Shuo Zhang on 16/3/11.
//  Copyright © 2016年 iAskData. All rights reserved.
//

#import "CTButtonIconCellAdapter.h"
#import "CTProfileQuestionStatusCell.h"

static CGFloat const kCTButtonIconCellHeight = 110.0f;

@interface CTButtonIconCellAdapter ()

@end

@implementation CTButtonIconCellAdapter

- (UITableViewCell<AKCell> *)dataViewController:(AKDataViewController *)dataViewController item:(id)item cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTProfileQuestionStatusCell *cell = [[CTProfileQuestionStatusCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CTProfileQuestionStatusCell"];
    return cell;
}

- (CGFloat)dataViewController:(AKDataViewController *)dataViewController item:(id<NSObject>)item groupStyle:(AKTableViewCellGroupStyle)groupStyle seperatorEnabled:(BOOL)seperatorEnabled heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCTButtonIconCellHeight;
}
@end
